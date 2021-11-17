//
//  SignIn.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI
import FirebaseAuth
import Firebase




//
//class AppViewModelA: ObservableObject{
//    let auth = Auth.auth()
//
//    @Published var signedIn = false
//    var isSignIn: Bool{
//        return auth.currentUser != nil
//    }
//
//    func signUp(email: String, password: String){
//        auth.createUser(withEmail: email, password: password){[weak self]
//            result, error in guard result != nil, error == nil else{
//                return
//            }
//            //Success
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
//        }
//    }
//}


struct SingUpView: View {
    @ObservedObject var model = ViewModels()
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var nic = ""
    @State var registrationN = ""
    @State var vehicleN = ""

    
    var body: some View {
        NavigationView{
                VStack{
                    
                    TextField("Name",text: $name)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                    
                    TextField("NIC Number",text: $nic)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                    
                    TextField("Registration Number",text: $registrationN)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                    
                    TextField("Vehicle Number",text: $vehicleN)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                    
                    TextField("Email Address",text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))


                    SecureField("Password",text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))

                    Button(action:{
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        model.addData(name: name, nic: nic, registerationN: registrationN, vehicleN: vehicleN, password: password, email: email)
                        name = ""
                         registrationN = ""
                        vehicleN  = ""
                        password  = ""
                        email = ""
                        
                    },label:{
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                        
                }
                }
                .navigationTitle("Sign Up")
                
//                .padding()
//                Spacer()
        }
            
//            .padding()
}
//        .onAppear{
//            viewModel.signedIn = viewModel.isSignIn
//        }
//    }
    //}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
            .preferredColorScheme(.dark)
    }
}
