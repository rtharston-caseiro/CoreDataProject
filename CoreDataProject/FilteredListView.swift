//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Reed Harston on 12/14/23.
//

import SwiftUI

struct FilteredListView<T: NSManagedObject, Content: View>: View {
    @FetchRequest private var results: FetchedResults<T>
    
    let content: (T) -> Content
    
    init(filterValue: String, predicate: NSPredicate.Option, filter: String?, @ViewBuilder content: @escaping (T) -> Content) {
        let nsPredicate = filter == nil ? nil : NSPredicate(format: "%K \(predicate.stringValue) %@", filterValue, filter!)
        _results = FetchRequest<T>(sortDescriptors: [], predicate: nsPredicate)
        self.content = content
    }
    
    var body: some View {
        List(results, id: \.self) { result in
            content(result)
        }
    }
}
