//
//  AVPlayer+utils.swift
//  HiitFit
//
//  Created by ENNBOU on 12/20/23.
//

import Foundation
import AVKit

extension AVPlayer {
  func getDuration() async -> Int {
    guard let asset = self.currentItem?.asset else { return 0 }
    do{
      let duration = try await asset.load(.duration)
      return Int(duration.seconds)
    }catch {
      return 0
    }
  }
}
