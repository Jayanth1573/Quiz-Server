//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Fluent

struct CreateTestsTableMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("tests")
            .id()
            .field("title",.string,.required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("tests")
            .delete()
    }
    
    
    
}
