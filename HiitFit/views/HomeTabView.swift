//
//  HomeTabView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/6/23.
//

import SwiftUI

struct ViewTest: View {
  
  let title: String
  let color: Color
  
  var body: some View {
    return ZStack{
      color.ignoresSafeArea()
      Text(title)
        .font(.title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .tabItem{
      Text("Title")
    }
  }
}

struct HomeTabView: View {
  var body: some View {
    GeometryReader{ geometry in
      TabView{
        NavigationStack{
          ViewTest(title: "tab1", color: .blue)
        }
        ViewTest(title: "tab1", color: .yellow)
        ViewTest(title: "tab1", color: .red)
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
      .ignoresSafeArea()
    }
  }
}

struct HomeTabView_Previews: PreviewProvider {
  static var previews: some View {
    HomeTabView()
  }
}
