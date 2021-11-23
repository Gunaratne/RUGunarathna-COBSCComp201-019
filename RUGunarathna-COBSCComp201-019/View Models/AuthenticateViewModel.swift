//
//  AuthenticateViewModel.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-22.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticateViewModel : ObservableObject{
    
    let auth = Auth.auth()
    var db = Firestore.firestore()
    
    private let authenticateService : AuthenticateServiceProtocol
    
    init(authService: AuthenticateServiceProtocol = AuthenticateService()){
        self.authenticateService = authService
    }
    @Published var signedIn = false
  
    @Published var error :Error?
   
    
 
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func SignIn(userEmail : String, userPassword: String ){
        authenticateService.SignIn(email:userEmail, password: userPassword ){ result in
            switch result{
            case .success:
                DispatchQueue.main.async {
                    self.signedIn = true
                }
            case let .failure(error):
                self.error = error
                print(error.localizedDescription)
            }
        }
    }
    
    func SignOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    
    func SignUp(name: String, nic: String, registerationN: String, vehicleN: String, password: String, email: String){
            Auth.auth().createUser(withEmail: email, password: password){ (authResult, error) in
                if let error = error as NSError? {
                    switch AuthErrorCode(rawValue: error.code) {

                    case .emailAlreadyInUse:
                        print("Error: Email Address already used.")
                    case .weakPassword:
                        print("Error: The password is week.")
                    default:
                        print("Error: \(error.localizedDescription)")
                    }
                } else {
                    let user = Auth.auth().currentUser
                    if let user = user {
                        
                        let object :[String: Any] = [
                            "authID" : user.uid,
                            "name" : name,
                            "nic" : nic,
                            "registationN": registerationN,
                            "vehicleN" : vehicleN ]
                        var ref: DocumentReference? = nil
                        ref = self.db.collection("User").addDocument(data:object){ err in
                            if let err = err {
                                print("Error writing document: \(err)")
                            } else {
                                print("Document successfully written!")
                                DispatchQueue.main.async {
                                    print("User signs up successfully")
                                    self.signedIn = true
                                }
                            }
                        }
                    }
                }
            }
        }
        
}
