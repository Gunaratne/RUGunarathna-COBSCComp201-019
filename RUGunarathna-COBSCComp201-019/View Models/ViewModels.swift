//
//  ViewModels.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import Foundation
import Firebase
import FirebaseAuth

class ViewModels: ObservableObject{
    @Published var list = [User]()
    
    @Published var cparking = [Vehicle]()
    
    
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("User").getDocuments{
            snapshort, erro in
            if erro == nil{
                if let snapshort = snapshort{
                
                    DispatchQueue.main.async {
                        self.list = snapshort.documents.map{
                            d in
                            return User(id: d.documentID, name: d["name"] as? String ?? "",
                                        nic: d["nic"] as? String ?? "",
                                        registrationN: d["registrationN"] as? String ?? "",
                                        vehicleN: d["vehicleN"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        password: d["password"] as? String ?? "")
                        }
                    }
                    
                }
            }
            else{
                
            }
        }
    }
    
    
    func addData(name: String, nic: String, registerationN: String, vehicleN: String, password: String, email: String){
        let db = Firestore.firestore()
        db.collection("User").addDocument(data: ["name" : name, "nic":nic, "registerationN": registerationN, "vehicleN": vehicleN, "email": email, "password":password ]){
            error in
                if error == nil{
                    
                }
                else{
                    
                }
            
        }
    }
    func signData(email: String, password: String){


        Auth.auth().createUser(withEmail: email, password: password){
            (Result, err) in
            if err != nil{
                
            }
            else{
                let db = Firestore.firestore()
                db.collection("User").addDocument(data: ["email": email, "password": password]){(error) in
                    if error != nil{
                        
                    }
                }
            }
        }
    }
    
    
    
    func fetchData(){
//        let db = Firestore.firestore()
//        db.collection("Vehicle").addSnapshotListener{ (querySnapshot, er)in
//            guard let documents = querySnapshot?.documents else{
//                print("No document")
//                return
//            }
//            self.cparking = documents.map{(
//                QueryDocumentSnapshot) -> Vehicle in
//                let data = QueryDocumentSnapshot.data()
//                let carNumber1 = data["carNumber1"] as? String ?? ""
//                let carNumber2 = data["carNumber2"] as? String ?? ""
//                let carNumber3 = data["carNumber3"] as? String ?? ""
//                let carNumber4 = data["carNumber4"] as? String ?? ""
//                let carNumber5 = data["carNumber5"] as? String ?? ""
//                let slot1A = data["slot1A"] as? String ?? ""
//                let slot2A = data["slot2A"] as? String ?? ""
//                let slot3A = data["slot3A"] as? String ?? ""
//                let slot4A = data["slot4A"] as? String ?? ""
//                let slot5A = data["slot5A"] as? String ?? ""
////                return Vehicle( id: <#ObjectIdentifier#>, carNumber1: carNumber1, carNumber2: carNumber2, carNumber3: carNumber3, carNumber4: carNumber4, carNumber5: carNumber5, slot1A: slot1A, slot2A: slot2A, slot3A: slot3A, slot4A: slot4A, slot5A: slot5A)
////
//                return
//            }
//        }
//    }
        let db = Firestore.firestore()
        db.collection("Vehicle").getDocuments{
            snapshort, erro in
            if erro == nil{
                if let snapshort = snapshort{
                    DispatchQueue.main.async {
                        self.cparking = snapshort.documents.map{
                            d in
                            return Vehicle(id: d.documentID, carNumber1: d["carNumber1"] as? String ?? "",
                                           carNumber2: d["slot1A"] as? String ?? "",
                                           carNumber3: d["carNumber2"] as? String ?? "",
                                           carNumber4: d["sloat2A"] as? String ?? "",
                                           carNumber5: d["carNumber3"] as? String ?? "",
                                           slot1A: d["sloat3A"] as? String ?? "",
                                           slot2A: d["carNumber4"] as? String ?? "",
                                           slot3A: d["sloat4A"] as? String ?? "",
                                           slot4A: d["carNumber5"] as? String ?? "",
                                           slot5A: d["sloat5A"] as? String ?? "")
                        }
                    }
                    
                }
            }
            else{
                
            }
        }
    
    
}
}
