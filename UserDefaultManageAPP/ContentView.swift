//
//  ContentView.swift
//  UserDefaultManageAPP
//
//  Created by Aswanth K on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExpenceViewModel()
    @State private var isShowAddExpence = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.expence, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.callout)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: { indexSet in
                    removeItem(at: indexSet)
                })
            }
            .navigationTitle("Expences")
            .toolbar {
                Button {
                    isShowAddExpence = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isShowAddExpence, content: {
                AddExpenceView(expences: viewModel)
            })
        }
    }
    func removeItem(at offset: IndexSet) {
        viewModel.expence.remove(atOffsets: offset)
    }
    func formatCurrency(amount: Double) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "USD"
            return formatter.string(from: NSNumber(value: amount)) ?? "$0.00"
        }
}

#Preview {
    ContentView()
}
