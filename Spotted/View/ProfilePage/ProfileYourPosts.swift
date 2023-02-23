//
//  ProfileYourPosts.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

struct ProfileYourPosts: View {
    @EnvironmentObject private var factory: ViewModelFactory
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Your Posts")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Spacer()
            }.padding()
            PostsList(viewModel: factory.makePostsViewModel(), searchText: viewModel.name, plusbutton: false)
                Spacer()
        }
    }
}

struct ProfileYourPosts_Previews: PreviewProvider {
    static var previews: some View {
        ProfileYourPosts(viewModel: ProfileViewModel(user: User.testUser, authService: AuthService())).environmentObject(ViewModelFactory.preview)
    }
}
