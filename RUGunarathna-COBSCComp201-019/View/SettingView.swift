////
////  SettingView.swift
////  RUGunarathna-COBSCComp201-019
////
////  Created by Ravindee on 2021-11-17.
////

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var authViewModel: AuthenticateViewModel
    @StateObject var modelSetting = SettingModels()
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                if let logUser = modelSetting.user.first{
                Image("SettingImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
              
                    Form{
                        
                            Section(header: Text("Personal Information")){
                                                       VStack(alignment: .leading){
                                                           Text("Name")
                                                               .fontWeight(.semibold)
                                                               .foregroundColor(.black)
                                                           Spacer(minLength: 10)
                                                           Text(logUser.name)
                                                               .foregroundColor(.gray)
                                                               .fontWeight(.semibold)
                                                       }
                                                      
                                                       VStack(alignment: .leading){
                                                           Text("NIC")
                                                               .fontWeight(.semibold)
                                                               .foregroundColor(.black)
                                                           Spacer(minLength: 10)
                                                           Text(logUser.nic)
                                                               .foregroundColor(.gray)
                                                               .fontWeight(.semibold)
                                                       }
                                                       VStack(alignment: .leading){
                                                           Text("Registration Number") .fontWeight(.semibold)
                                                               .foregroundColor(.black)
                                                           Spacer(minLength: 10)
                                                           Text(logUser.registrationN)
                                                               .foregroundColor(.gray)
                                                               .fontWeight(.semibold)
                                                       }
                                                       VStack(alignment: .leading){
                                                           Text("Vehicle Number") .fontWeight(.semibold)
                                                               .foregroundColor(.black)
                                                           Spacer(minLength: 10)
                                                           Text(logUser.vehicleN)
                                                               .foregroundColor(.gray)
                                                               .fontWeight(.semibold)
                                                       }
                                                   }
                        Button(action:{
                            authViewModel.SignOut()
               
                                   }, label: {
                                       Text("Sign Out")
                                           .foregroundColor(Color.white)
                                                                       .frame(width: 200, height: 50)
                                                                       .cornerRadius(8)
                                                                       .background(Color.blue)
               
                                   })
                        
                        
                        }
                    }
                    

                 
                    
                        
                    
                   
        
        
            }
        }
        .onAppear(){
        modelSetting.GetUserDeatils()
}
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
