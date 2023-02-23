//
//  NewPostForm.swift
//  Spotted
//
//  Created by Meher Khurana on 11/27/22.
//

import SwiftUI


// MARK: - NewPostForm

struct NewPostForm: View {
    @StateObject var viewModel: FormViewModel<Post>
    @Environment(\.dismiss) private var dismiss
    @State private var date1 = Date.now
    @State private var showNewPostForm = false
    @State var isPresented = false
    @State var isPresented1 = false
    @State  var selectedFilter: PostFilterViewModel = .all
  
    let image = UIImage()
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
      
        NavigationView {
                VStack{
                        VStack{
                           
                            HStack{
                                Text("New Post")
                                    .font(.title3)
                                    .bold()
                                    .padding(.top)
                                    .padding(.leading)
                                Spacer()
                            }
                         
                        Form{
                            
                            interestSelection
                          
                                Text("Details: " + viewModel.date.formatted(date: .abbreviated, time: .shortened))
                                
                                Section("Description"){
                               // TextEditor(text: $viewModel.content)
                                //        .multilineTextAlignment(.leading)
                            caption
                            //TextArea("What's happening?", text: $viewModel.content)
                             
                            }
                         
                           // ImageSection(imageURL: $viewModel.imageURL)
                            
                           
                           
                            
                            
                       //Text("Interest: " + viewModel.intrests)
                            
                              
                            
                            
                        }
                            
                            
                            
                    }
                    
                    Button(action: viewModel.submit) {
                        
                     
                        
                        
                    if viewModel.isWorking {
                        ProgressView()
                    } else {
                        HStack{
                           /* Button{
                                isPresented = true
                            }label: {
                                Label("Interests", image: "photo")
                                
                            }*/
                            Button{
                                isPresented1 = true
                            }label: {
                                Label("Schedule", image: "photo")
                            }
                            Spacer()
                            Text("Create Post")
                                .bold()
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        
                        
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .padding()
                .listRowBackground(Color.blue)
            }
            .onSubmit(viewModel.submit)
        }
       /* .popup(isPresented: $isPresented) {
            BottomPopupView {
                IntrestSelect(viewModel: viewModel, isPresented: $isPresented)
                    .edgesIgnoringSafeArea(.top)
            }
        }*/
        .popup(isPresented: $isPresented1) {
            BottomPopupView {
                Sceduale(viewModel: viewModel, isPresented1: $isPresented1)
                    .edgesIgnoringSafeArea(.top)
            }
        }
            .alert("Cannot Create Post", error: $viewModel.error)
            .disabled(viewModel.isWorking)
            .onChange(of: viewModel.isWorking) { isWorking in
                guard !isWorking else { return }
                dismiss()
            }
                Spacer()
        }
}
private extension NewPostForm{
    struct Sceduale: View{
        @StateObject var viewModel: FormViewModel<Post>
        @State private var date = Date.now
        @Binding var isPresented1: Bool
        @State var text = ""
        var body: some View{
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Schedule your event!")
                    //.font(.system(size: 25, weight: .bold, design: .default))
                        .padding()
                        .font(.headline).bold()
                    Spacer()
                    Button(action: {
                        isPresented1 = false
                    }, label: {
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 32, height: 32)
                            .background(Color.black.opacity(0.06))
                            .cornerRadius(16)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    })
                }
                
                
                VStack {
                    
                    HStack(alignment: .top){
                        DatePicker( "Select date & time", selection: $date)
                        
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            saveDate()
                        }, label: {
                            Text("Done")
                        })
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }.padding(.top)
                    
                    
                }.padding(.all)
            }
        }
        
        func saveDate() {
            // convert the selected date to a string and save it
            
            viewModel.date = date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-mm-ss"
                
            let date = dateFormatter.string(from: date)
            viewModel.time = date
            isPresented1 = false
            
            
            // save the date string to your desired location, such as a database or file on disk
        }
    }
}





private extension NewPostForm{
    struct IntrestSelect: View{
        @StateObject var viewModel: FormViewModel<Post>
        
        @Binding var isPresented: Bool
        @State var text = ""
        
        @State private var sb1 = 0
        @State private var sb2 = 0
        @State private var sb3 = 0
        @State private var sb4 = 0
        @State private var sb5 = 0
        @State private var sb6 = 0
        
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Select Related Interests")
                        //.font(.system(size: 25, weight: .bold, design: .default))
                        .padding()
                        .font(.headline).bold()
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 32, height: 32)
                            .background(Color.black.opacity(0.06))
                            .cornerRadius(16)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    })
                }
                VStack{
                    
                    HStack{
                        Text("Sports")
                            .padding()
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    VStack{
                        HStack{
                            Button{
                                sb1+=1
                                sb1%=2
                                if sb1 == 1 {
                                    viewModel.intrests = "Sports"
                                }
                                if sb2 == 1||sb3 == 1||sb4 == 1||sb5 == 1{
                                    sb5=0
                                    sb2=0
                                    sb3=0
                                    sb4=0
                                    sb1=0
                                }
                            }label: {
                                Text("Sports")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb1 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                   // .shadow(radius: 10)
                            } .padding(.leading)
                            Button{
                                sb2+=1
                                sb2%=2
                                if sb2 == 1 {
                                viewModel.intrests = "music"
                                    if sb1 == 1||sb3 == 1||sb4 == 1||sb5 == 1{
                                        sb1=0
                                        sb5=0
                                        sb3=0
                                        sb4=0
                                        sb2=0
                                    }
                            }
                            }label: {
                                Text("Music")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb2 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                  //  .shadow(radius: 10)
                            }.padding(.horizontal, 11)
                            Button{
                                sb3+=1
                                sb3%=2
                                if sb3 == 1{
                                    viewModel.intrests = "Band"
                                }
                                if sb2 == 1||sb1 == 1||sb4 == 1||sb5 == 1{
                                    sb1=0
                                    sb2=0
                                    sb4=0
                                    sb5=0
                                    sb3=0
                                }
                            }label: {
                                Text("Band")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb3 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                             //       .shadow(radius: 10)
                            }
                            Button{
                                sb4+=1
                                sb4%=2
                                if sb4 == 1{
                                    viewModel.intrests = "Math"
                                }
                                if sb2 == 1||sb3 == 1||sb1 == 1||sb5 == 1{
                                    sb1=0
                                    sb2=0
                                    sb3=0
                                    sb5=0
                                    sb4=0
                                }
                            }label: {
                                Text("Math")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb4 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                  //  .shadow(radius: 10)
                            }.padding(.horizontal, 11)
                            Spacer()
                        }
                        HStack{
                            Button{
                                sb5+=1
                                sb5%=2
                                if sb5 == 0 {
                                    viewModel.intrests = "CS"
                                }
                                if sb2 == 1||sb3 == 1||sb4 == 1||sb1 == 1{
                                    sb1=0
                                    sb2=0
                                    sb3=0
                                    sb4=0
                                    sb5=0
                                }
                            }label: {
                                Text("CS")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb5 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                   // .shadow(radius: 10)
                            }.padding(.leading) .padding(.top,5)
                            Spacer()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Done")
                    })
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }.padding()
            }
        }
    }
}
        
// MARK: - ImageSection






private extension NewPostForm {
    struct ImageSection: View {
        @Binding var imageURL: URL?
        
        var body: some View {
            Section("Image") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 500, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                } placeholder: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 500, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                    ImagePickerButton(imageURL: $imageURL) {
                        Label("Choose Image", systemImage: "photo.fill")
                            .foregroundColor(.blue)
                }
            }
        }
    }
}

// MARK: - Preview

struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
       
         NewPostForm(viewModel: FormViewModel<Post>(initialValue: Post.testPost, action: { _ in }))
    }
}

                   
extension NewPostForm{
    var interestSelection: some View {
        VStack {
            
            Text("Select Interest")
                .font(.headline)
                .bold()
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(PostFilterViewModel.allCases, id: \.rawValue) { item in
                    ZStack {
                        Text(item.title)
                        
                            .font(.headline)
                            .fontWeight(selectedFilter == item ? .semibold: .regular)
                            .foregroundColor(selectedFilter == item ? .orange : .gray)
                            .cornerRadius(17)
                        
                        
                    }.onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedFilter = item
                            viewModel.intrests = item.title
                        }
                    }
                }
            }
            .padding(.all)
        }
        
        .cornerRadius(30)
        
    }
    
    
    var caption: some View {
        
        HStack(alignment: .top) {
            Circle()
                .frame(width: 64, height: 64)
            
            TextArea("What's happening?", text: $viewModel.content)
        }
        
        
    }
    
    
    var CancleAndPost: some View {
        HStack {
            Button {
               // presentationMode.wrappedValue.dismiss()
            } label : {
                Text("Cancle")
                    .foregroundColor(Color.orange)
            }
            
            Spacer()
            
            Button {
                print("Post")
            } label : {
                Text("Post")
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
        .padding()
        
    }
}
