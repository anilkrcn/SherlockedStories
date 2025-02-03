import CoreData

func preloadStories() {
    // JSON dosyasını bulun
    guard let url = Bundle.main.url(forResource: "stories", withExtension: "json") else {
        print("JSON dosyası bulunamadı.")
        return
    }
    
    do {
        // JSON dosyasını oku
        let data = try Data(contentsOf: url)
        let decodedStories = try JSONDecoder().decode([Story].self, from: data)
        
        // Core Data konteksini alın
        let context = persistentContainer.viewContext
        
        // Her hikayeyi Core Data'ya ekle
        for story in decodedStories {
            let newStory = StoryModel(context: context)
            newStory.id = Int64(story.id)
            newStory.title = story.title
            newStory.hint = story.hint
            newStory.solution = story.solution
            newStory.difficulty = Int16(story.difficulty)
            newStory.isSolved = story.isSolved
            newStory.isLocked = story.isLocked
        }
        
        // Değişiklikleri kaydet
        try context.save()
        print("Hikayeler başarıyla yüklendi.")
    } catch {
        print("Veriler yüklenirken hata oluştu: \(error)")
    }
}

func checkAndPreloadData() {
    let hasPreloaded = UserDefaults.standard.bool(forKey: "hasPreloadedData")
    if !hasPreloaded {
        preloadStories()
        UserDefaults.standard.set(true, forKey: "hasPreloadedData")
    }else{
        print("Hikayeler zaten yüklenmiştir.")
    }
}
