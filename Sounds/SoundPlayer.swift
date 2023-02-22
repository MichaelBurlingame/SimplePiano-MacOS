//
//  SoundPlayer.swift
//  MacApp
//
//  Created by Michael Burlingame on 2/21/23.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSounds(_ soundFileName : String) {
    let url = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("error")
    }
}
