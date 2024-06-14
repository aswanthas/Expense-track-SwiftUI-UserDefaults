//
//  ExpenceData.swift
//  UserDefaultManageAPP
//
//  Created by Aswanth K on 14/06/24.
//

import Foundation
struct ExpenceData: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
