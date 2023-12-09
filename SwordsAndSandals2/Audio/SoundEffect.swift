//
//  SoundEffect.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import AVFAudio

var soundEffectPlayer: AVAudioPlayer?

/// plays a file looping indefinitely
///
/// - Parameters:
///     - sound: name of the audio file in your xcode project
///     - type: type of file for sound parameter (ex: "mp3")
/// - Returns:
///     - plays music if possible

func playSound(sound: String, type: String) {
    if let bundle = Bundle.main.path(forResource: sound, ofType: type) {
        let backgroundSound = NSURL(fileURLWithPath: bundle)
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf:backgroundSound as URL)
            try AVAudioSession.sharedInstance().setCategory(.playback)
            guard let backgroundAudioPlayer = backgroundAudioPlayer else { return }
            backgroundAudioPlayer.prepareToPlay()
            backgroundAudioPlayer.play()
        } catch {
            print(error)
        }
    }
}
