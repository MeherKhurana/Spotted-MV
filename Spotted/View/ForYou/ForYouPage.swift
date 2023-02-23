//
//  ForYouPage.swift
//  Spotted
//
//  Created by Meher Khurana on 11/27/22.
//

import SwiftUI

struct ForYouPage: View {
    @State private var selectedOption: InterestBarOptions = .math
    @StateObject var viewModel: ProfileViewModel
    @EnvironmentObject private var factory: ViewModelFactory
    var body: some View {
        VStack{
            InterestOptionList(selectedOption: $selectedOption)
                .padding(.leading)
            Group {
                switch selectedOption {
                case .math:
                    PostsList(viewModel: factory.makePostsViewModel(), searchText: "Math", plusbutton: true)
                case .science:
                    PostsList(viewModel: factory.makePostsViewModel(), searchText: "Science", plusbutton: true)
                case .computerScience:
                    PostsList(viewModel: factory.makePostsViewModel(), searchText: "CS", plusbutton: true)
                case .arts:
                    PostsList(viewModel: factory.makePostsViewModel(), searchText: "Arts", plusbutton: true)
                case .sports:
                    PostsList(viewModel: factory.makePostsViewModel(), searchText: "Sports", plusbutton: true)
                }
            }
            
            Spacer()
        }
    }
}

    struct ForYouPage_Previews: PreviewProvider {
        static var previews: some View {
            ForYouPage(viewModel: ProfileViewModel(user: User.testUser, authService: AuthService())) .environmentObject(ViewModelFactory.preview)
        }
    }
