//
//  Movie+Defaults.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import Foundation

extension Singer {
    public var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}
