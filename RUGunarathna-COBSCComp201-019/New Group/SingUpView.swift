//
//  SignIn.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SingUpView: View {
    @ObservedObject var viewModel = AuthenticateViewModel()
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
                        viewModel.SignUp(name: name, nic: nic, registerationN: registrationN, vehicleN: vehicleN, password: password, email: email)
                        name = ""
                        nic = ""
                         registrationN = ""
                        vehicleN  = ""
                        password  = ""
                        email = ""

                        
                    },label:{
                        Text("Sign Up")
                            .foregroundColor(Color.white)
                                                        .frame(width: 200, height: 50)
                                                        .cornerRadius(8)
                                                        .background(Color.blue)
                    })
                   

                        .navigationTitle("Sign Up")
                        .padding()
            
                }
                .padding()
                Spacer()
                }
                

        }
}



struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
            .preferredColorScheme(.dark)
    }
}
