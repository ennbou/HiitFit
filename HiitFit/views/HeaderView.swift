//
//  HeaderView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct HeaderView: View {

  let title: String
  let numberOfExercises: Int

  @Binding var selectedTab: Int
  
  var body: some View {
    VStack{
      
      Text(title)
        .fontWeight(.bold)
        .font(.title)
      
      HStack{
        ForEach(1...numberOfExercises, id:\.self){ index in
          Button(action: {}){
            Text(String(index))
              .foregroundColor(selectedTab == index ? .red : .blue)
              .frame(width:25, height:25)
          }
        }
      }
      
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(title: "Exercise Name",numberOfExercises: Exercise.exercises.count, selectedTab: .constant(2))
  }
}
