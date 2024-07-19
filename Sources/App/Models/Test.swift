//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Vapor
import Fluent

final class Test: Model, Content {
    static let schema = "tests"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Children(for: \.$test)
    var questions: [Question]
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
