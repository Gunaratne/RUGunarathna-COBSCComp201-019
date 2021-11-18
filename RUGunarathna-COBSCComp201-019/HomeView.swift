//
//  HomeView.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: BookingView()){
                    Text("Booking")
                }
                .navigationTitle("Home page")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
