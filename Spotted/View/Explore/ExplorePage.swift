//
//  DiscoverPage.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

struct Explore_Page: View {
    @EnvironmentObject private var factory: ViewModelFactory
    var body: some View {
        VStack{
            HStack{
                Text("Discovery")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
            }
            .padding()
            Divider()
            PostsList(viewModel: factory.makePostsViewModel(),searchText: "", plusbutton: false)
            Spacer()
        }
    }
}

struct Explore_Page_Previews: PreviewProvider {
    static var previews: some View {
        Explore_Page().environmentObject(ViewModelFactory.preview)
    }
}
