//
//  AuthenticateService.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-16.
//


import Foundation
import FirebaseAuth

protocol AuthenticateServiceProtocol{
    func SignIn(email: String, password: String, completion: @escaping (Result<Void, Error>)->  Void )
}

final class AuthenticateService : AuthenticateServiceProtocol{
    let auth = Auth.auth();
    
    func SignIn(email: String, password: String, completion: @escaping (Result<Void, Error>)->  Void ){
        auth.signIn(withEmail: email, password: password){ (authResult, error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .wrongPassword:
                    completion(.failure(error))
                case .invalidEmail:
                    completion(.failure(error))
                default:
                    completion(.failure(error))
                }
            }
            else{
                completion(.success(()))
            }
        }
    }
}
