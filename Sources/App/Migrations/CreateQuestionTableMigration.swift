//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Fluent

struct CreateQuestionTableMigration: AsyncMigration {

    func prepare(on database: Database) async throws {
        try await database.schema("questions")
                   .id()
                   .field("test_id", .uuid, .references("tests", "id"))
                   .field("questionText", .string, .required)
                   .field("options", .array(of: .string), .required)
                   .field("correctAnswer", .string, .required)
                   .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("questions")
            .delete()
    }
    
    
}
