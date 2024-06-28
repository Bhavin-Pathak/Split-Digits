//
//  ContentView.swift
//  Split-Digits
//
//  Created by MacBookPro on 21/03/1946 Saka.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = GameViewModels()
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text("SPLIT DIGITS \(Image(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard"))")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(.teal)
                
                GridLayout(boxes: $viewModel.boxes, onSelect: viewModel.selectBox)
            }
            .alert(isPresented: Binding(
                get: { viewModel.boxes.allSatisfy { $0.isMatched } },
                set: { _ in viewModel.resetGame() }
            )) {
                Alert(title: Text("You are win!"), message: Text("Congratulation"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

