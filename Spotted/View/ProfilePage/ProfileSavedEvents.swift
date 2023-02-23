//
//  ProfileSavedEvents.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

struct ProfileSavedEvent: View {
    @EnvironmentObject private var factory: ViewModelFactory
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack{
                HStack{
                    Text("Joined")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
            }
            Divider()
            PostsList(viewModel: factory.makePostsViewModel(filter: .favorites), searchText: "", plusbutton: false)
            Spacer()
        }
    }
}

struct ProfileSavedEvent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSavedEvent(viewModel: ProfileViewModel(user: User.testUser, authService: AuthService())).environmentObject(ViewModelFactory.preview)
    }
}
