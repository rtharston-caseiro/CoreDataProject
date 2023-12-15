//
//  Movie+Defaults.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import Foundation

extension Movie {
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}
