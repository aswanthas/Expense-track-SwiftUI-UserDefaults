//
//  AddExpenceView.swift
//  UserDefaultManageAPP
//
//  Created by Aswanth K on 14/06/24.
//

import SwiftUI

struct AddExpenceView: View {
    @ObservedObject var expences: ExpenceViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new Expence")
            .toolbar {
                Button("Save") {
                    let expense = ExpenceData(name: name, type: type, amount: amount)
                    expences.expence.append(expense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    return AddExpenceView(expences: ExpenceViewModel())
}
