//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation

struct TestResponseDTO: Codable {
    let id: UUID
    let title: String
    
    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
}
