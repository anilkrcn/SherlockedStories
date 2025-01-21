//
//  SaveViewModel.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 15.01.2025.
//

import Foundation
import CoreData

class SaveViewModel{
    let context = persistentContainer.viewContext
    
    func save(title: String, hint: String){
        let storyModel = StoryModel(context: context)
        storyModel.title = title
        storyModel.hint = hint
        
        saveContext()
    }
}
