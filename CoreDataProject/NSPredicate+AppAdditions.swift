//
//  NSPredicate+AppAdditions.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/15/23.
//

import Foundation

extension NSPredicate {
    enum Option {
        case lessThan, greaterThan, equals
        case _in
        case beginsWith, beginsWithInsensitive
        
        var stringValue: String {
            switch self {
            case .lessThan:
                "<"
            case .greaterThan:
                ">"
            case .equals:
                "=="
            case ._in:
                "IN"
            case .beginsWith:
                "BEGINSWITH"
            case .beginsWithInsensitive:
                "BEGINSWITH[c]"
            }
        }
    }
}
