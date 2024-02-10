//
//  ContentView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct ContentView: View {
  
  @State var selectedTab = 0
  @StateObject var historyStore = HistoryStore()
  
  var body: some View {
    VStack{
      TabView(selection: $selectedTab){
        HomeScreen(selectedTab: $selectedTab)
          .tag(0)
        ForEach(0..<Exercise.exercises.count, id: \.self){ index in
          ExerciseView(exercise: Exercise.exercises[index], selectedTab: $selectedTab)
            .tag(index+1)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    .environmentObject(historyStore)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(HistoryStore())
  }
}
