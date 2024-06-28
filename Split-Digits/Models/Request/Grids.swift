//
//  Grids.swift
//  Split-Digits
//
//  Created by MacBookPro on 21/03/1946 Saka.
//

import Foundation

struct Grids: Identifiable {
    let id = UUID()
    let value: Int
    var isRevealed: Bool = false
    var isMatched: Bool = false
}
