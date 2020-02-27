//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Heather Mason on 2/27/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
