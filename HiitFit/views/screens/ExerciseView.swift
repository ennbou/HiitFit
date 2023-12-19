//
//  ExerciseView.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
  
  let exercise: Exercise
  
  var body: some View {
    VStack{
      
      let exerciseVideo = exercise.name.rawValue.lowercased().replacingOccurrences(of: " ", with: "")
      let player = AVPlayer(url: Bundle.main.url(forResource: "\(exerciseVideo)", withExtension: "mp4")!)
      
      VideoPlayer(player: player)
      Spacer()
      Text(exercise.name.rawValue)
    }
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(exercise: Exercise.exercises.first ?? Exercise(name: .pushups))
  }
}
