//
//  ContentView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct ContentView: View {
  
  @State var selectedTab = 0
  
  var body: some View {
    VStack{
      if(selectedTab > 0){
        HeaderView(selectedTab: $selectedTab)
      }
      
      TabView(selection: $selectedTab){
        HomeScreen(selectedTab: $selectedTab)
          .tag(0)
        ForEach(0..<Exercise.exercises.count, id: \.self){ index in
          ExerciseView(exercise: Exercise.exercises[index])
            .tag(index+1)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
