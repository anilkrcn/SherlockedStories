//
//  Story.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 13.01.2025.
//

import Foundation

class Story: Codable{
    let id: Int
    let title: String
    let hint: String
    let solution: String
    let difficulty: Int
    let isSolved: Bool
}

