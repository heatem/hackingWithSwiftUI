//
//  ContentView.swift
//  iExpense
//
//  Created by Heather Mason on 2/26/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var backgroundColor = Color.yellow
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                    }
                    .listRowBackground(self.setColor(for: item.amount))
                }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing:
                    Button(action: {
                        self.showingAddExpense = true
                        
                    }) {
                        Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func setColor(for amount: Int) -> Color {
        switch amount {
        case Int.min..<0:
            return Color.green
        case 0..<10:
            return Color.yellow
        case 10..<100:
            return Color.orange
        default:
            return Color.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
