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
    @Published var user = [User]()
    
    var db = Firestore.firestore()
       let firebaseAuth = Auth.auth()
      
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
       
   }
