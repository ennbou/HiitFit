//
//  Exercise.swift
//  HiitFit
//
//  Created by ENNBOU on 12/18/23.
//

import Foundation

enum GYM_EXERCISE: String,CaseIterable {
  case squat = "Squat"
  case legPress = "Leg press"
  case uprightRow = "Upright Row"
  case benchPress = "Bench press"
  case pushups = "Pushups"
}

struct Exercise {
  let id = UUID()
  let name: GYM_EXERCISE
}

extension Exercise {
  static let exercises = GYM_EXERCISE.allCases.map{Exercise(name: $0)}
}
