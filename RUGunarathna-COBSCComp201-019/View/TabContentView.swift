//
//  TabContentView.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-22.
//

import SwiftUI

struct TabContentView: View {
    @EnvironmentObject var authViewModel: AuthenticateViewModel
    var body: some View {
        TabView{
                HomeScreen()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            if authViewModel.signedIn{
                BookingView()
                    .onAppear{
                        authViewModel.signedIn = authViewModel.isSignedIn
                    }
                    .tabItem{
                        Image(systemName: "calendar.badge.plus")
                        Text("Booking")
                    }
            }
            
            else{
                ContentView()
                    .onAppear{
                        authViewModel.signedIn = authViewModel.isSignedIn
                    }
                    .tabItem{
                        Image(systemName: "calendar.badge.plus")
                        Text("Booking")
                    }
            }
            if authViewModel.signedIn{
               SettingView()
                    .onAppear{
                        authViewModel.signedIn = authViewModel.isSignedIn
                    }
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settigs")
                    }
            }
            else{
                ContentView()
                    .onAppear{
                        authViewModel.signedIn = authViewModel.isSignedIn
                    }
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settigs")
                    }
            }
        }
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
