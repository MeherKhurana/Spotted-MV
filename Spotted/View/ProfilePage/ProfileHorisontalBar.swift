//
//  HorMainProfile.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI
import Foundation

struct ProfileHorisontalBar: View {
    
        let sections: [FilterCategory] = FilterCategory.allCases
        @State var selected: FilterCategory = .Joined
        @StateObject var viewModel: ProfileViewModel
        @EnvironmentObject private var factory: ViewModelFactory
        let Events: [String] = [""]
        let Posts = [""]

    var body: some View {
        VStack{
            Group {
                VStack {
                    HorizontalFilterView(viewModel: HorizontalFilterViewModel(items: sections), selectedItem: $selected)
                    Divider()
                    switch selected {
                    case .Joined:
                        ForEach(Events, id: \.self) { item in
                            PostsList(viewModel: factory.makePostsViewModel(filter: .favorites), searchText: "", plusbutton: false)
                        }
                    case .Posts:
                        ForEach(Posts, id: \.self) { item in
                            PostsList(viewModel: factory.makePostsViewModel(), searchText: viewModel.name, plusbutton: false)
                        }
                    }
                }
            }
        }
    }
    }
   

    struct ProfileHorisontalBar_Previews: PreviewProvider {
        static var previews: some View {
            ProfileHorisontalBar(viewModel: ProfileViewModel(user: User.testUser, authService: AuthService())) .environmentObject(ViewModelFactory.preview)
        }
    }
