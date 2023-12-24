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
  @State var time: Int = 0
  @State var player: AVPlayer? = nil
  @State var exerciseVideo: String? = nil
  @State var isTimeCompleted: Bool = false
  @State var isStarted: Bool = false
  let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
  
  var body: some View {
    GeometryReader{ geometry in
      VStack{
        
        VideoPlayer(player: player)
          .frame(width: geometry.size.width, height: geometry.size.width)
        
        HStack{
          Spacer()
          Button(action:{
            isStarted = true
            player?.play()
          }){
            Text("Start")
          }.disabled(isTimeCompleted)
          Spacer()
          Button(action:{}){
            Text("Done")
          }.disabled(!isTimeCompleted)
          Spacer()
        }
        if(isStarted){
          Text("time : \(time)s")
            .onReceive(timer){ _ in
              if(time > 0){
                time -= 1
              }else{
                timer.upstream.connect().cancel()
              }
            }.padding()
        }else{
          Text("Duration: \(time)s")
            .padding()
        }
        Text(exercise.name.rawValue)
          .padding(.bottom)
      }.onAppear {
        let exerciseVideo = exercise.name.rawValue.lowercased().replacingOccurrences(of: " ", with: "")
        self.exerciseVideo = exerciseVideo
        player = AVPlayer(url: Bundle.main.url(forResource: "\(exerciseVideo)", withExtension: "mp4")!)
        Task{
          if let player = player {
            let duration = await player.getDuration()
            time = duration
          }
        }
      }
    }
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(exercise: Exercise.exercises.first ?? Exercise(name: .pushups))
  }
}
