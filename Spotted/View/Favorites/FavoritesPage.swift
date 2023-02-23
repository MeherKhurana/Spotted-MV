//
//  FavoritesPage.swift
//  Spotted
//
//  Created by Meher Khurana on 12/30/22.
//

import SwiftUI

struct FavoritesPage: View {
    @EnvironmentObject private var factory: ViewModelFactory
    var body: some View {
        VStack{
            HStack{
                Text("Saved Events")
                    .font(.title2)
                Spacer()
            }
            PostsList(viewModel: factory.makePostsViewModel(filter: .favorites), searchText: "", plusbutton: false)
            Spacer()
        }
    }
}

struct FavoritesPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPage()
    }
}
