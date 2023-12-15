//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import SwiftUI

struct FilteredListView: View {
    @FetchRequest private var singers: FetchedResults<Singer>
    
    init(filter: String?) {
        let predicate = filter == nil ? nil : NSPredicate(format: "lastName BEGINSWITH %@", filter!)
        _singers = FetchRequest<Singer>(sortDescriptors: [], predicate: predicate)
    }
    
    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}
