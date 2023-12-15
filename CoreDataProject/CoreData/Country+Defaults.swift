//
//  Country+Defaults.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import Foundation

extension Country {
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    public var candyArray: [Candy] {
        let candySet = candy as? Set<Candy> ?? []
        return candySet.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}
