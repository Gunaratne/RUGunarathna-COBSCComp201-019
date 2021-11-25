//
//  BookingViewModel.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class BookingViewModel : ObservableObject{
    var db = Firestore.firestore()
    let firebaseAuth = Auth.auth()
    @Published var user = [User]()
    @Published var avaliableParkingLots = [ParkingSlot]()
    
    func GetUserDeatils(){
       
        let userID = firebaseAuth.currentUser?.uid
        db.collection("User").whereField("authID", isEqualTo: userID ?? "").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.user = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let authID = data["authID"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let nic = data["nic"] as? String ?? ""
                let vehicleN = data["vehicleN"] as? String ?? ""
                let registationN = data["registationN"] as? String ?? ""
                print(data)
                return User(id: id, authID: authID, name: name,  nic: nic, registrationN: registationN, vehicleN: vehicleN)
            }
            print(self.user)
        }
        
    }
    
    func GetAvaliable(){
        
        db.collection("ParkingSlots").whereField("status", isEqualTo: "0").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.avaliableParkingLots = documents.map { (queryDocumentSnapshot) -> ParkingSlot in
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
    //Save method of the booking
    
    func Reservation(bookingInfo:BookingSlot, authID: String){
        bookingInfo.authID = authID
        let object :[String: Any] = [
            "userID" : bookingInfo.authID,
            "ParkingLotID" : bookingInfo.selectedSlot]

        var ref: DocumentReference? = nil
        ref = self.db.collection("Reservations").addDocument(data: object){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Reservation Document successfully written!")
                self.db.collection("ParkingLots").document(bookingInfo.selectedSlot).updateData(["Status" : "Booked", "VehicleN": self.user.first?.vehicleN ?? "", "ResevationCanceledTime": self.BookingCanceledTime()]){ err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Parking Lot Document successfully Updated!")
                        
                    }
                }
            }
        }
    }
    
    
    func BookingCanceledTime() -> String {
        let timeFormater = DateFormatter()
        timeFormater.dateFormat = "HH:mm"
        let time = timeFormater.string(from: Date().addingTimeInterval(10*60) as Date)
        return time
    }
}
