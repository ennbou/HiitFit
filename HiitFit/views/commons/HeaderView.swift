//
//  HeaderView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct HeaderView: View {
  
  let numberOfExercises = Exercise.exercises.count
  
  @Binding var selectedTab: Int
  
  var body: some View {
    VStack{
      if(selectedTab > 0){
        Text(Exercise.exercises[selectedTab-1].name.rawValue)
          .fontWeight(.bold)
          .font(.title)
        
        HStack{
          ForEach(1...numberOfExercises, id:\.self){ index in
            Button(action: {
              selectedTab = index
            }){
              Text(String(index))
                .foregroundColor(selectedTab == index ? .red : .blue)
                .frame(width:25, height:25)
            }
          }
        }
      }
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(2))
  }
}
