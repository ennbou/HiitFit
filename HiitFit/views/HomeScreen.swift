//
//  HomeScreen.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct HomeScreen: View {
  
  @State var selectedTab = 0
  @State var historyIsPresented = false
  
  var body: some View {
    VStack{
      
      HeaderView(title: "Welcome", numberOfExercises: Exercise.exercises.count, selectedTab: $selectedTab)
      
      Spacer()
      
      AsyncImage(url: URL(string: "https://img.grouponcdn.com/iam/2LtxfBqrnmYk8VvpHpjNNh5Quxrp/2L-2048x1229/v1/c870x524.webp")) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 150, height: 150)
          .clipShape(Circle())
      } placeholder: {
        Color.gray
          .frame(width: 150, height: 150)
          .clipShape(Circle())
      }
      
      Text("Git Fit")
        .font(.largeTitle)
      Text("with high intensity interval training")
        .font(.caption)
        .padding(.bottom)
      
      Button(action: {}){
        Text("Get Start")
          .font(.title)
      }
      .padding(.vertical, 8)
      .padding(.horizontal, 24)
      .background(.blue)
      .foregroundColor(.white)
      .clipShape(Capsule())
      
      Spacer()
      
      Button(action: {
        historyIsPresented.toggle()
      }){
        Text("History")
      }.sheet(isPresented: $historyIsPresented){
        Text("History")
      }
      
    }
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
