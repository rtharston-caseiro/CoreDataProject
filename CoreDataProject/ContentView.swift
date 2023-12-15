//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var countries: FetchedResults<Country>
    
    @State private var filter: String?
    
    var body: some View {
        VStack {
            FilteredListView(filterValue: "fullName", predicate: .beginsWith, filter: filter) { (country: Country) in
                Section(country.wrappedFullName) {
                    ForEach(country.candyArray, id: \.self) { candy in
                        Text(candy.wrappedName)
                    }
                }
            }

            Button("Add Examples") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                try? moc.save()
            }
            
            Button("Show U") {
                filter = "U"
            }
            Button("Show S") {
                filter = "S"
            }
            Button("Show All") {
                filter = nil
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
