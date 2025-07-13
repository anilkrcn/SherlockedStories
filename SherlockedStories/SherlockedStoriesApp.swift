//
//  SherlockedStoriesApp.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 5.01.2025.
//

import SwiftUI
import CoreData
import GoogleMobileAds

@main
struct SherlockedStoriesApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding = false
    init() {
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
        AppTrackingManager.requestTrackingAuthorization()
        MobileAds.shared.start(completionHandler: nil)
        setupNavigationBarAppearance()
    }
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                            HomeScreen()
                        } else {
                            InitialOnboardingView()
                        }
        }
    }
    func setupNavigationBarAppearance() {
           // let appearance = UINavigationBarAppearance()

            // Geri düğmesi rengi
            UIBarButtonItem.appearance().tintColor = UIColor.sherlockBeige
           
        }
}

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "StoryModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

