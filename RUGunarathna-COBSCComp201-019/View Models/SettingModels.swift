//
//  SettingModels.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-21.
//

import Foundation
import Firebase
import FirebaseAuth

class SettingModels: ObservableObject{
    @Published var list = [User]()
    
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
    
}

