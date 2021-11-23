//
//  HomeViewModel.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-23.
//

import Foundation
import FirebaseFirestore

class HomeViewModel : ObservableObject{
    var db = Firestore.firestore()
    @Published var avaliable = [ParkingSlot]()
    @Published var reserved = [ParkingSlot]()
    
    func GetAvaliable(){
        
        db.collection("ParkingSlots").whereField("status", isEqualTo: "0").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.avaliable = documents.map { (queryDocumentSnapshot) -> ParkingSlot in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let vehicleN = data["vehicleN"] as? String ?? ""
                let parkingSlot = data["parkingSlot"] as? String ?? ""
                let parkingType = data["parkingType"] as? String ?? ""
                let status = data["status"] as? String ?? ""
                print(data)
                return ParkingSlot(id: id, vehicleN: vehicleN, parkingSlot: parkingSlot, parkingType: parkingType, status: status)
            }
        }
    }
    func GetReserved(){
        
        db.collection("ParkingSlots").whereField("status", isEqualTo: "1").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.avaliable = documents.map { (queryDocumentSnapshot) -> ParkingSlot in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let vehicleN = data["vehicleN"] as? String ?? ""
                let parkingSlot = data["parkingSlot"] as? String ?? ""
                let parkingType = data["parkingType"] as? String ?? ""
                let status = data["status"] as? String ?? ""
                print(data)
                return ParkingSlot(id: id, vehicleN: vehicleN, parkingSlot: parkingSlot, parkingType: parkingType, status: status)
            }
        }
    }
}

