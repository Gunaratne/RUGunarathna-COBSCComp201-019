//
//  Vehicle.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-18.
//

import Foundation
struct ParkingSlot: Identifiable{
    
    var id: String
    var vehicleN: String
    var parkingSlot: String
    var parkingType: String
    var status: String
    
}

struct Parking: Identifiable{
    var id: String
    var parkingSlot: String
    var parkingType: String
}

