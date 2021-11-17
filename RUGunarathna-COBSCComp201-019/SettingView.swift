//
//  SettingView.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-17.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var modelSetting = ViewModels()
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                Form{
//                    if($email == email){
                        List (modelSetting.list){
                            item in
//                            Text("Name")
                            Text(item.name)
//                            Text("NIC")
                            Text(item.nic)
//                            Text("Registration")
                            Text(item.registration)
//                            Text("Vehicle Number")
                            Text(item.vehicleN)
//                        }
                    }
                        .padding()
//                    else{
//                        
//                    }
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                Text("Copyright @ All right reserved")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom,8)
                    .foregroundColor(Color.secondary)
            }
            .navigationTitle("Setting")
        }
        
        }
    init(){
        modelSetting.getData()
    
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
