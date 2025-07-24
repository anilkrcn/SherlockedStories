//
//  StoryDetailViewModel.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 13.01.2025.
//

import Foundation
import CoreData

class StoryDetailViewModel: ObservableObject {
    
    @Published var stories =  [StoryModel]()
    let context = persistentContainer.viewContext
    
    func loadStories() {
        do{
            let fetchRequest = StoryModel.fetchRequest()
            let storiesList = try context.fetch(fetchRequest)
            
            stories = storiesList
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func storiesByDifficulty(diff: Int){
        do{
            let fetchRequest = StoryModel.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "difficulty == %d", diff)
            fetchRequest.sortDescriptors = [
                        NSSortDescriptor(key: "isLocked", ascending: true),
                        NSSortDescriptor(key: "isSolved", ascending: true),
                        NSSortDescriptor(key: "title", ascending: true),// false olanlar önce// Alfabetik sıralama (isteğe bağlı)
                    ]
            let list = try context.fetch(fetchRequest)
            
            stories = list
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func update(storyModel: StoryModel, isSolved: Bool){
        storyModel.isSolved = isSolved
        saveContext()
    }
    
    func unlocked(storyModel: StoryModel, isLocked: Bool){
        storyModel.isLocked = isLocked
        saveContext()
    }
    
    
}

