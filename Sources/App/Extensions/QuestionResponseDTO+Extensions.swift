//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Vapor
extension QuestionResponseDTO: Content {
    
    init?(_ question: Question) {
        guard let questionId = question.id else {
            return nil
        }
        
        self.init(id: questionId, questionText: question.questionText, options: question.options, correctAnswer: question.correctAnswer)
    }
}
