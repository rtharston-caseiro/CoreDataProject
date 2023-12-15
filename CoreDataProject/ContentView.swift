//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter: String? = nil
    
    var body: some View {
        VStack {
            FilteredListView(filter: lastNameFilter, filterValue: "lastName") { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Show All") {
                lastNameFilter = nil
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
