//
//  HistoryView.swift
//  HiitFit
//
//  Created by ENNBOU on 1/2/24.
//

import SwiftUI

struct HistoryView: View {
  
  @ObservedObject var historyStore: HistoryStore
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack{
      Form{
        ForEach(Array(historyStore.exercises.keys), id: \.self){ key in
          Section(header: Text("\(key)")) {
            ForEach(historyStore.exercises[key] ?? [], id: \.date){ exerciseDay in
              Text("\(exerciseDay.exercise.name.rawValue)")
            }
          }
        }
      }
    }
    Button(action: {
      dismiss()
    } ){
      Text("Done")
    }
  }
}

#Preview {
  HistoryView(historyStore: HistoryStore())
}
