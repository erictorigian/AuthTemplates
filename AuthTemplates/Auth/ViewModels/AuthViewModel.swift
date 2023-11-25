//
//  AuthViewModel.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init () {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUserData()
        }
    }
    
    func signIn(withEmail: String, password: String) async throws {

    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUserData()
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser  = nil

        } catch let signOutError as NSError {
            print("DEBUG: Error signing out: \(signOutError)")
          }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUserData() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument()
        
        self.currentUser = try? snapshot?.data(as: User.self)
        print("DEBUG: current user was fetched \(String(describing: self.currentUser))")
    }
    
    func sendPasswordReset(email: String) {
        
    }
}
