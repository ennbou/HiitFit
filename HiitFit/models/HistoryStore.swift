//
//  HistoryStore.swift
//  HiitFit
//
//  Created by ENNBOU on 1/2/24.
//

import Foundation

struct ExerciseDay {
  var exercise: Exercise
  var date: Date
}

let dateNow = Date.now
let dateTomorrow = Calendar.current.date(byAdding: .day, value:1, to: dateNow)

let testExercisesDay = [
  ExerciseDay(exercise: Exercise(name: .benchPress), date: dateNow),
  ExerciseDay(exercise: Exercise(name: .legPress), date: dateNow),
  ExerciseDay(exercise: Exercise(name: .pushups), date: dateNow),
  ExerciseDay(exercise: Exercise(name: .squat), date: dateTomorrow!),
  ExerciseDay(exercise: Exercise(name: .uprightRow), date: dateTomorrow!),
]

func getFormattedDate(date: Date) -> String {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd"
  return dateFormatter.string(from: date)
}
  

class HistoryStore: ObservableObject{
  
  @Published var exercises: [String : [ExerciseDay]] = Dictionary(grouping: testExercisesDay, by: {getFormattedDate(date: $0.date)})
}
