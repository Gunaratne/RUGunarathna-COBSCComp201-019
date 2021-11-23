//
//  User.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import Foundation

struct User: Identifiable{

    //user
    var id: String
    var authID: String
    var name: String
    var nic: String
    var registrationN: String
    var vehicleN: String
}


class UserInfol : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var vehicleN = ""
    @Published var registrationN = ""
    @Published var nic = ""
    @Published var name = ""
    @Published var id = ""
}

