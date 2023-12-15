//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    static let starWarsOnly = NSPredicate(format: "universe == 'Star Wars'")
    static let lessThanF = NSPredicate(format: "name < %@", "F")
    static let inArray = NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    static let beginsWithE = NSPredicate(format: "name BEGINSWITH %@", "E")
    static let beginsWithECaseInsensitive = NSPredicate(format: "name BEGINSWITH[c] %@", "e")
    static let doesNotBeginWithE = NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")
    static let starWarsBeginsWithE = NSCompoundPredicate(andPredicateWithSubpredicates: [starWarsOnly, beginsWithE])
    
    @FetchRequest(sortDescriptors: [], predicate: Self.starWarsBeginsWithE) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
