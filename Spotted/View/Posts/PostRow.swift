
import SwiftUI

// MARK: - PostRow

struct PostRow: View {
    @ObservedObject var viewModel: PostRowViewModel
    
    @State private var showConfirmationDialog = false
   
    @EnvironmentObject private var factory: ViewModelFactory
    let dateFormatter = DateFormatter()
    var body: some View {
 
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AuthorView(author: viewModel.author)
                    .frame(width: 56, height: 56)
            
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(viewModel.author.name)
                            .font(.subheadline).bold()
                        
                        if !viewModel.location.isEmpty || !viewModel.time.isEmpty {
                            Text("#Event")
                                .foregroundColor(.orange)
                                .font(.caption)
                        
                        }
                    }
                   
                    if !viewModel.time.isEmpty {
                        Text(viewModel.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                   
                        
                    
                   
                    
                }
            }.padding(10)
              //  Text(viewModel.timestamp.formatted(date: .abbreviated, time: .omitted))
               //     .font(.caption)
            
            if let imageURL = viewModel.imageURL {
                PostImage(url: imageURL)
            }
            Text(viewModel.title)
                .font(.subheadline).bold()
                .multilineTextAlignment(.leading)
        
            Text(viewModel.content)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
        
            Spacer()
            
            
            HStack {
                FavoriteButton(isFavorite: viewModel.isFavorite, action: {
                    viewModel.favoritePost()
                })
                Spacer()
                NavigationLink {
                    CommentsList(viewModel: factory.makeCommentsViewModel(for: viewModel.post))
                } label: {
                    Label("Comments", systemImage: "text.bubble")
                        .foregroundColor(.secondary)
                }
                Spacer()
               
               
                Spacer()
                if viewModel.canDeletePost {
                    Button(role: .destructive, action: {
                        showConfirmationDialog = true
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .padding(10)
            .labelStyle(.iconOnly)
            
        }
        
        .confirmationDialog("Are you sure you want to delete this post?", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
            Button("Delete", role: .destructive, action: {
                viewModel.deletePost()
            })
        }
        .alert("Error", error: $viewModel.error)
        .background(.white)
        .cornerRadius(20)
        
        
                
    }
}

// MARK: - AuthorView

private extension PostRow {
    struct AuthorView: View {
        let author: User
       
        @EnvironmentObject private var factory: ViewModelFactory
        
        var body: some View {
           
                    ProfileImage(url: author.imageURL)
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.lightGray))
                        .padding(.leading, 10)
                    
                 
                
            
                    
            
        }
    }
}

// MARK: - PostImage

private extension PostRow {
    struct PostImage: View {
        let url: URL
        
        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Color.clear
            }
        }
    }
}

// MARK: - FavoriteButton

private extension PostRow {
    struct FavoriteButton: View {
        let isFavorite: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                if isFavorite {
                    Image(systemName: "person.badge.plus.fill")
                } else {
                    Image(systemName: "person.badge.plus")
                        
                }
            }
            .foregroundColor(isFavorite ? .red : .gray)
            .animation(.default, value: isFavorite)
        }
    }
}



struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(viewModel: PostRowViewModel(post: Post.testPost, deleteAction: {}, favoriteAction: {}))
            .environmentObject(ViewModelFactory.preview)
            .previewLayout(.sizeThatFits)
    }
}

