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
    
    
}

