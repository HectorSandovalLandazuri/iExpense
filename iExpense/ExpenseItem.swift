//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Héctor Manuel Sandoval Landázuri on 26/04/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}
