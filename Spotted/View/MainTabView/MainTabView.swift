//
//  MainTabView.swift
//  Socialcademy
//
//  Created by John Royal on 1/9/22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var factory: ViewModelFactory
    
    var body: some View {
        TabView {
            NavigationView {
                ForYouPage(viewModel: factory.makeProfileViewModel()).background(.gray.opacity(0.09))
            }
            .tabItem {
                Label("", systemImage: "house")
            }
           /* NavigationView{
                NotificationPage()
            }.tabItem{
                Label("Messages", systemImage: "message")
            }*/

            
            NavigationView {
                ProfileView(viewModel: factory.makeProfileViewModel())
            }
                .tabItem {
                    Label("", systemImage: "person")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ViewModelFactory.preview)
    }
}
