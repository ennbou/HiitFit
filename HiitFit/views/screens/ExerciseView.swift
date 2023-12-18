//
//  ExerciseView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI

struct ExerciseView: View {
  
  let exercise: Exercise
  
  var body: some View {
    VStack{
      Spacer()
      Text(exercise.name.rawValue)
    }
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(exercise: Exercise.exercises.first ?? Exercise(name: .benchPress))
  }
}
