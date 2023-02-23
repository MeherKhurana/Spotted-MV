//
//  PostsList.swift
//  Socialcademy
//
//  Created by John Royal on 1/9/22.
//

import SwiftUI

struct PostsList: View {
    @StateObject var viewModel: PostsViewModel 
    let searchText: String
    @State private var showNewPostForm = false
    @State private var showNewPostForm1 = false
    let plusbutton: Bool
    @State private var showImageSourceDialog = false
    var body: some View {
        Group {
            switch viewModel.posts {
            case .loading:
                ProgressView()
            case let .error(error):
                EmptyListView(
                    title: "Cannot Load Posts",
                    message: error.localizedDescription,
                    retryAction: {
                        viewModel.fetchPosts()
                    }
                )
            case .empty:
                EmptyListView(
                    title: "",
                    message:"Currently No Posts or Events"
                )
            case let .loaded(posts):
                VStack{
                    ScrollView{
                            ForEach(posts) { post in
                                if searchText.isEmpty || post.contains(searchText) {
                                    PostRow(viewModel: viewModel.makePostRowViewModel(for: post))
                                }
                            }
                            .animation(.default, value: posts)
                    }
                }
            }
        }
        .padding(10)
        
        
        .onAppear {
            viewModel.fetchPosts()
        }
        .sheet(isPresented: $showNewPostForm) {
            NewPostForm(viewModel: viewModel.makeNewPostViewModel())
        }
        .toolbar {
            if plusbutton == true{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Explore Page")
                        .font(.title2).bold()
                       
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showNewPostForm = true
                    } label: {
                        Label("Post", systemImage: "plus")
                    }
                }
            }
        }
        .background(.gray.opacity(0.09))
    }
}

extension PostsList {
    struct RootView: View {
        @StateObject var viewModel: PostsViewModel
        
        var body: some View {
            NavigationView {
                PostsList(viewModel: viewModel, searchText: "",plusbutton: false)
            } 
           
        }
    }
}

#if DEBUG
struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        ListPreview(state: .loaded([Post.testPost]))
        ListPreview(state: .empty)
        ListPreview(state: .error)
        ListPreview(state: .loading)
    }
    
    @MainActor
    private struct ListPreview: View {
        let state: Loadable<[Post]>
        
        var body: some View {
            let postsRepository = PostsRepositoryStub(state: state)
            let viewModel = PostsViewModel(postsRepository: postsRepository)
            NavigationView {
                PostsList(viewModel: viewModel, searchText: "", plusbutton: false)
                    .environmentObject(ViewModelFactory.preview)
                  
            }
        }
    }
}
#endif
