//
//  GridsViewModel.swift
//  Split-Digits
//
//  Created by Bhavin.
//

import SwiftUI

class GameViewModels: ObservableObject {
    
    @Published var boxes: [GameModels]
    @Published var firstSelectedBox: GameModels?
    @Published var secondSelectedBox: GameModels?
    
    init() {
        let digitsarrays = [6, 8, 3, 15, 15, 13, 9, 13, 3, 5, 7, 10, 12, 4, 6, 9, 1, 18, 16, 11, 14, 14, 8, 2, 4, 5, 7, 18, 1, 17, 16, 12, 10, 11, 17, 2]
        boxes = digitsarrays.map { GameModels(value: $0) }
    }
    //MARK: Selection of Grids
    func selectBox(_ box: GameModels) {
        guard !box.isMatched else { return }
        
        if firstSelectedBox == nil {
            firstSelectedBox = box
            updateBox(box, isRevealed: true)
        } else if secondSelectedBox == nil && box.id != firstSelectedBox?.id {
            secondSelectedBox = box
            updateBox(box, isRevealed: true)
            checkMatch()
        }
    }
    //MARK: Cheak Grids Matching Winning Status
    func checkMatch() {
        guard let firstBox = firstSelectedBox, let secondBox = secondSelectedBox else { return }
        
        if firstBox.value == secondBox.value {
            updateBox(firstBox, isMatched: true)
            updateBox(secondBox, isMatched: true)
            firstSelectedBox = nil
            secondSelectedBox = nil
            checkWin()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.updateBox(firstBox, isRevealed: false)
                self.updateBox(secondBox, isRevealed: false)
                self.firstSelectedBox = nil
                self.secondSelectedBox = nil
            }
        }
    }
    //MARK:  Cheak Status Of Winning
    func checkWin() {
        if boxes.allSatisfy({ $0.isMatched }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showWinAlert()
            }
        }
    }
    
    //MARK: Display Win Aleart Massage
    func showWinAlert() {
        // Display an alert saying "You win" and reset the game
    }
    
    func updateBox(_ box: GameModels, isRevealed: Bool? = nil, isMatched: Bool? = nil) {
        if let index = boxes.firstIndex(where: { $0.id == box.id }) {
            if let isRevealed = isRevealed {
                boxes[index].isRevealed = isRevealed
            }
            if let isMatched = isMatched {
                boxes[index].isMatched = isMatched
            }
        }
    }
    //MARK: Reset Game
    func resetGame() {
        firstSelectedBox = nil
        secondSelectedBox = nil
        boxes = boxes.map { GameModels(value: $0.value) }
    }
}
