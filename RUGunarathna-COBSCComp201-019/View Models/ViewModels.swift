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
                                        registration: d["registration"] as? String ?? "",
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
    
    
}
