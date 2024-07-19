//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation

struct QuestionRequestDTO: Codable {
    let questionText: String
    let options: [String]
    let correctAnswer: String
    
    init(questionText: String, options: [String], correctAnswer: String) {
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
    }
}
