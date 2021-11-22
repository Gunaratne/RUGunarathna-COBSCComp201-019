//
//  RUGunarathna_COBSCComp201_019App.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI
import Firebase

@main
struct RUGunarathna_COBSCComp201_019App:App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
       var body: some Scene {
           WindowGroup {
               let authViewModel = AuthenticateViewModel()
               TabContentView()
                   .environmentObject(authViewModel)
           }
       }
   }

   class AppDelegate:NSObject,UIApplicationDelegate{
       func application(_ application:UIApplication,didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey:Any]?=nil)->Bool{
           FirebaseApp.configure()
           return true
       }
}


