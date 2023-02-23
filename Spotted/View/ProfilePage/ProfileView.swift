//
//  ProfileView.swift
//  Socialcademy
//
//  Created by John Royal on 1/9/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                VStack() {
                    ProfileImage(url: viewModel.imageURL)
                        .frame(width: 100, height: 100)
                        
                    Text(viewModel.name)
                        .font(.title2)
                        .bold()
                        .padding()
                    ImagePickerButton(imageURL: $viewModel.imageURL) {
                        Label("Choose Image", systemImage: "photo.fill")
                        
                      
                    }
                    
                    
                    ProfileHorisontalBar( viewModel: viewModel)
                    Spacer()
                }
            }
           
        }
        .navigationTitle("Profile")
        .toolbar {
            Button("Sign Out", action: {
                viewModel.signOut()
            })
        }

        .alert("Error", error: $viewModel.error)
        .disabled(viewModel.isWorking)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(user: User.testUser, authService: AuthService()))
    }
}
