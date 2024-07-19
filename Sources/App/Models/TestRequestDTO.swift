//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation

struct TestRequestDTO: Codable {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
