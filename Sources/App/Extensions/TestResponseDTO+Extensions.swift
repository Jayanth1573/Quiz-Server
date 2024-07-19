//
//  File.swift
//  
//
//  Created by Jayanth Ambaldhage on 18/07/24.
//

import Foundation
import Vapor

extension TestResponseDTO: Content {
    
    init?(_ test: Test) {
        guard let id = test.id
        else {
            return nil
        }
        
        self.init(id: id, title: test.title)
    }
}
