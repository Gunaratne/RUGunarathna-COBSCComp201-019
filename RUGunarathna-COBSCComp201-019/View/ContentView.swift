//
//  ContentView.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//

import SwiftUI
import FirebaseAuth

//class AppViewModel: ObservableObject{
//    let auth = Auth.auth()
//    
//    @Published var signedIn = false
//    var isSignIn: Bool{
//        return auth.currentUser != nil
//    }
//    
//    func signIn(email: String, password: String){
//        auth.signIn(withEmail: email,
//                    password: password){[weak self]
//            result, error in guard result != nil, error == nil else{
//                return
//            }
//            //Sucess
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
//        }
//       
//    }
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


struct ContentView: View {
    @EnvironmentObject var authViewModel : AuthenticateViewModel
    @State var email = ""
        @State var password = ""
    
//        @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{

            VStack{
                Image("Packing Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack{
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
                        authViewModel.SignIn(userEmail: email, userPassword: password)
                      

                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                                                        .frame(width: 200, height: 50)
                                                        .cornerRadius(8)
                                                        .background(Color.blue)
                    }                        
                    )
                    NavigationLink("Create Account",destination: SingUpView())
                    .padding()

                }
                .padding()
                Spacer()
        }
            .navigationTitle("Sign In")
}

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
