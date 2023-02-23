//
//  Created by Artem Novichkov on 20.05.2021.
//

import SwiftUI

struct NamePopupView: View {
    
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
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .padding(.leading)
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
                })
            }
                VStack{
                    
                    HStack{
                        Text("Sports")
                            .padding()
                            .bold()
                            .font(.title2)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    VStack(spacing: 10){
                        HStack{
                            Button{
                                sb1+=1
                                sb1%=2
                            }label: {
                                Text("Sports")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb1 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                            } .padding(.leading)
                            Button{
                                sb2+=1
                                sb2%=2
                            }label: {
                                Text("Music")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb2 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                            }.padding(.horizontal, 11)
                            Button{
                                sb3+=1
                                sb3%=2
                            }label: {
                                Text("Band")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb3 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                            }
                            Button{
                                sb4+=1
                                sb4%=2
                            }label: {
                                Text("Math")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb4 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                            }.padding(.horizontal, 11)
                            Spacer()
                        }
                        HStack{
                            Button{
                                sb5+=1
                                sb5%=2
                            }label: {
                                Text("CS")
                                    .padding(11)
                                    .foregroundColor(.black)
                                    .background((sb5 != 0) ? Color.yellow: Color(UIColor.systemGray3))
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
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
                .frame(width: 80, height: 36)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct NamePopupView_Previews: PreviewProvider {
    static var previews: some View {
        NamePopupView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
