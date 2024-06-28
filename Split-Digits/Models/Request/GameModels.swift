//
//  Grids.swift
//  Split-Digits
//
//  Created by Bhavin Pathak on 28/06/2024
//

import Foundation

struct GameModels: Identifiable {
    let id = UUID()
    let value: Int
    var isRevealed: Bool = false
    var isMatched: Bool = false
}
