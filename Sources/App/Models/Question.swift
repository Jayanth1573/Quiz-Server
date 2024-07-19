//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Vapor
import Fluent

final class Question: Model, Content {
    static let schema = "questions"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "test_id")
    var test: Test
    
    @Field(key: "questionText")
    var questionText: String
    
    @Field(key: "options")
    var options: [String]
    
    @Field(key: "correctAnswer")
    var correctAnswer: String
    
    init() {}
    
    init(id: UUID? = nil, testId: UUID, questionText: String, options: [String], correctAnswer: String) {
        self.id = id
        self.$test.id = testId
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
    }
}
