//
//  ContentView.swift
//  iExpense
//
//  Created by Héctor Manuel Sandoval Landázuri on 20/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(item.amount>100 ? .red : item.amount > 20 ? .yellow : .primary)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount,format:.currency(code: "USD"))
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(item.name + String(item.amount))
                    .accessibilityHint(item.type)
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                   Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems (at offsets:IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
