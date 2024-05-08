//
//  HapticManager.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/7/24.
//

import Foundation
import UIKit

/// For generating Haptic vibrations
class HapticManager {
    
    private init() {}
    
    static let shared = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
