//
//  Achievements.swift
//  charm
//
//  Created by Emanuele Giunta on 04/03/22.
//

import Foundation
import SwiftUI

struct Achievement: Identifiable {
    var id = UUID()
    var title: LocalizedStringKey
    var description: LocalizedStringKey
    var steps: Int
    var stepsDone: Int
    var isRead: Bool = false
}

class AchievementView: ObservableObject {
    @Published var achievements: [Achievement] = Achievement.list
}

extension Achievement {
    static let list = [
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 1, stepsDone: 1, isRead: true),
        Achievement(title: "Find 10 items", description: "I don't even know really tbh", steps: 10, stepsDone: 0, isRead: false),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 7, isRead: true),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 6, isRead: true),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 5, isRead: true),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 4, isRead: true),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 3, isRead: true),
        Achievement(title: "Play one game", description: "I don't even know really tbh", steps: 10, stepsDone: 2, isRead: true)

    ]

}
