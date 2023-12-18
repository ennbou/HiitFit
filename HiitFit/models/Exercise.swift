//
//  Exercise.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import Foundation

enum GYM_EXERCISE: CaseIterable {
  case squat
  case legPress
  case uprightRow
  case benchPress
  case pushups
}


struct Exercise {
  let id = UUID()
  let name: GYM_EXERCISE
}

extension Exercise {
  static let exercises = GYM_EXERCISE.allCases.map{Exercise(name: $0)}
}
