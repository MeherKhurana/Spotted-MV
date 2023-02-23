//
//  AuthView.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        if let viewModelFactory = viewModel.makeViewModelFactory() {
            MainTabView()
                .environmentObject(viewModelFactory)
        } else {
                NavigationView {
                    SignInForm(viewModel: viewModel.makeSignInViewModel()) {
                        Spacer()
                        HStack{
                            Text("Don't have an account?")
                                .font(.footnote)
                            NavigationLink("Sign Up", destination: CreateAccountForm(viewModel: viewModel.makeCreateAccountViewModel()))
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
    }
    
}

private extension AuthView {
    struct SignInForm<Footer: View>: View {
        @StateObject var viewModel: AuthViewModel.SignInViewModel
        @ViewBuilder let footer: () -> Footer
        
        var body: some View {
            Form {
                
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope",
                                     placeholderText: "Email",
                                     textCase: .lowercase,
                                     keyboardType: .emailAddress,
                                     textContentType: .emailAddress,
                                     text: $viewModel.email)
                    
                    
                    CustomInputField(imageName: "lock",
                                     placeholderText: "Password",
                                     textCase: .lowercase,
                                     keyboardType: .default,
                                     textContentType: .password,
                                     isSecureField: true,
                                     text: $viewModel.password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                
               
               
            } footer: {
                Button("Sign In", action: viewModel.submit)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                footer()
                    .padding()
            }
           
            .alert("Cannot Sign In", error: $viewModel.error)
            .disabled(viewModel.isWorking)
            .onSubmit(viewModel.submit)
        }
    }
}

private extension AuthView {
    struct CreateAccountForm: View {
        @StateObject var viewModel: AuthViewModel.CreateAccountViewModel
        
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            VStack{
                Form {
                   
                    VStack(spacing: 40) {
                        
                        CustomInputField(imageName: "envelope",
                                         placeholderText: "Email",
                                         textCase: .lowercase,
                                         keyboardType: .emailAddress,
                                         textContentType: .emailAddress,
                                         text: $viewModel.email)
                        
                        CustomInputField(imageName: "person",
                                         placeholderText: "Username",
                                         textCase: .lowercase,
                                         keyboardType: .emailAddress,
                                         textContentType: .emailAddress,
                                         text: $viewModel.name)
                        
                        CustomInputField(imageName: "lock",
                                         placeholderText: "Password",
                                         textContentType: .newPassword,
                                         isSecureField: true,
                                         text: $viewModel.password)
                        
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 44)
                }footer: {
                    
                    
                    
                    Button("Sign up", action: viewModel.submit)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    Spacer()
                    
                    Spacer()
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.footnote)
                        if #available(iOS 16.0, *) {
                            Button("Sign in", action: dismiss.callAsFunction)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        } else {
                            // Fallback on earlier versions
                        }
                    }.padding()

                    
                    
    
                    
                    
                }
            }
            .alert("Cannot Create Account", error: $viewModel.error)
            .disabled(viewModel.isWorking)
            .onSubmit(viewModel.submit)
        }
    }
}

private extension AuthView {
    struct Form<Fields: View, Footer: View>: View {
        @ViewBuilder let fields: () -> Fields
        @ViewBuilder let footer: () -> Footer
        
        var body: some View {
            VStack {
                Text("Spotted")
                    .font(.custom("Urbanist-SemiBold", size: 30))
                Image("Auth Logo")
                    .resizable()
                    .frame(width: 250, height:  150)
                fields()
                footer()
            }.padding(.top)
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
