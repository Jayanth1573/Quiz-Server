//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Vapor
import Fluent

class TestsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api")
        
        
        // POST: /api/tests
        api.post("tests", use: saveTests)
        
        // GET: /api/tests
        api.get("tests", use: getTests)
        
        // POST:  /api/tests/:testId/questions
        api.post("tests",":testId","questions", use: saveQuestions)
        
        // GET:  /api/tests/:testId/questions
        api.get("tests",":testId","questions", use: getQuestions)
    }
    
    func getQuestions(req: Request) async throws -> [QuestionResponseDTO] {
        
        guard let testId = req.parameters.get("testId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let test = try await Test.query(on: req.db)
            .filter(\.$id == testId)
            .first() else {
            throw Abort(.notFound)
        }
        
        return try await Question.query(on: req.db)
            .filter(\.$test.$id == test.id!)
            .all()
            .compactMap(QuestionResponseDTO.init)
        
    }
    
    func saveQuestions(req: Request) async throws -> QuestionResponseDTO {
        guard let testId = req.parameters.get("testId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let test = try await Test.query(on: req.db)
            .filter(\.$id == testId)
            .first() else {
            throw Abort(.notFound)
        }
        
        let questionRequestDTO = try req.content.decode(QuestionRequestDTO.self)
        
        let question = Question(testId: test.id!, questionText: questionRequestDTO.questionText, options: questionRequestDTO.options, correctAnswer: questionRequestDTO.correctAnswer)
        
        try await question.save(on: req.db)
        
        guard let questionResponseDTO = QuestionResponseDTO(question) else {
            throw Abort(.internalServerError)
        }
        return questionResponseDTO
    }
    
    
    func getTests(req: Request) async throws -> [TestResponseDTO] {
        return try await Test.query(on: req.db)
            .all()
            .compactMap(TestResponseDTO.init)
    }
    
    func saveTests(req: Request) async throws -> TestResponseDTO {
        
        let testRequestDTO = try req.content.decode(TestRequestDTO.self)
        
        let test = Test(title: testRequestDTO.title)
        try await test.save(on: req.db)
        
        guard let testResponseDTO = TestResponseDTO(test) else {
            throw Abort(.internalServerError)
        }
        
        return testResponseDTO
    }
    
    
}
