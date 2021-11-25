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
    
    @Published var cparking = [ParkingSlot]()
    
    
    
    //Sign View
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
    //Login View
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
 
}
}
