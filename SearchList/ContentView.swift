//
//  ContentView.swift
//  SearchList
//
//  Created by Cyrus Chen on 12/4/2023.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: stored propreties
    @State var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5",]
    
    @State var searchText = ""
    
    //MARK: Computed propreties
    var filteredItems: [String]{
        
        if searchText.isEmpty {
            return items
            
        }else{
            var matchingItems: [String] = []
            
            for item in items {
                if item.lowercased().contains(searchText.lowercased()) {
                    matchingItems.append(item)
                }
            }
            return matchingItems
        }
    }
    var body: some View{
        
        NavigationView{
            
            VStack{
                
                Text("Searching on: \(searchText)")
                
                List(filteredItems, id: \.self) {
                    currentItem in
                    Text(currentItem)
                }
                .searchable(text: $searchText)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
