//
//  RUGunarathna_COBSCComp201_019App.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI
import Firebase

@main
struct RUGunarathna_COBSCComp201_019App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            let viewModel = AppViewModel()
//            let viewModelA = AppViewModelA()
            ContentView()
//                            .environmentObject(viewModel)
//                            .environmentObject(viewModelA)
        }
    }
}

//class AppDelegate: NSObject,UIApplicationDelegate{
//func application(_application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
//FirebaseApp.configure()
//return true
//}
//}

