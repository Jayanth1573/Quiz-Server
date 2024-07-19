//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation

struct QuestionResponseDTO: Codable {
    let id: UUID
    let questionText: String
    let options: [String]
    let correctAnswer: String
    
    init(id: UUID, questionText: String, options: [String], correctAnswer: String) {
        self.id = id
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
}
