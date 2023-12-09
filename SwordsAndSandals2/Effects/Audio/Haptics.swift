//
//  Haptics.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import CoreHaptics
import SwiftUI

var hapticsEngine: CHHapticEngine?

func prepareHaptics() {
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

    do {
        hapticsEngine = try CHHapticEngine()
        try hapticsEngine?.start()
    } catch {
        print("There was an error creating the engine: \(error.localizedDescription)")
    }
}

func hapticFeedback(for combatAction: CombatAction) {
    switch combatAction {
    case .strengthAttack:
        strengthHaptic()
    case .agilityAttack:
        agilityHaptic()
    case .magicAttack:
        magicHaptic()
    }
}

func strengthHaptic() {
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
    var events = [CHHapticEvent]()
    
    // Swing
    let swingIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.2)
    let swingSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
    let swingEvent = CHHapticEvent(eventType: .hapticContinuous, parameters: [swingIntensity, swingSharpness], relativeTime: 0, duration: 0.3)
    events.append(swingEvent)
    
    // Contact
    let hitIntentisy = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9)
    let hitSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
    let hitEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [hitIntentisy, hitSharpness], relativeTime: 0.3)
    events.append(hitEvent)
    
    
    // convert those events into a pattern and play it immediately
    do {
        let pattern = try CHHapticPattern(events: events, parameters: [])
        let player = try hapticsEngine?.makePlayer(with: pattern)
        try player?.start(atTime: 0)
    } catch {
        print("Failed to play pattern: \(error.localizedDescription).")
    }
}

func agilityHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.warning)
}

func magicHaptic() {
    // make sure that the device supports haptics
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
    var events = [CHHapticEvent]()
    
    // buildup
    for i in stride(from: 0.0, to: 1.0, by: 0.05) {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: pow(Float(i),2))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
        
        events.append(event)
    }
    
    
    // convert those events into a pattern and play it immediately
    do {
        let pattern = try CHHapticPattern(events: events, parameters: [])
        let player = try hapticsEngine?.makePlayer(with: pattern)
        try player?.start(atTime: 0)
    } catch {
        print("Failed to play pattern: \(error.localizedDescription).")
    }
}
