//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        NavigationStack {
            List {
                // MARK: - HEADER VIEW
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                
                // MARK: - ACCOUNT INFO
                Section("Account information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@gmail.com")
                    }
                }
                
                // MARK: - LEGAL
                Section("Legal") {
                    Text("Terms of Services")
                }
                
                // MARK: - LOGOUT/DELETE
                
                Section {
                    Button("Logout") {
                        print("DEBUH: Logout here..")
                    }
                    .foregroundStyle(.red)
                }
                Section {
                    Button("Delete Account") {
                        print("DEBUG: Delete account here..")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
