//
//  ExpenceViewModel.swift
//  UserDefaultManageAPP
//
//  Created by Aswanth K on 14/06/24.
//

import Foundation
class ExpenceViewModel: ObservableObject {
    @Published var expence = [ExpenceData]() {
        // Whenever the values of the expense change, they need to be stored in UserDefaults in an encoded form for privacy.
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(expence) {
                UserDefaults.standard.set(encoded, forKey: "expenceItem")
            } else {
                debugPrint("Failed to save the expence data")
            }
        }
    }
    // When this ViewModel is initialized, it loads the stored data from UserDefaults,
    // decodes it, and assigns it to the `expence` property.
    init() {
        if let saveExpence = UserDefaults.standard.data(forKey: "expenceItem") {
            if let decodeExpence = try? JSONDecoder().decode([ExpenceData].self, from: saveExpence) {
                expence = decodeExpence
                return
            }
        }
        expence = []
    }
}
