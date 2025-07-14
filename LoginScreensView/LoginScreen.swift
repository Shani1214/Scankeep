//
//  LoginScreen.swift
//  ScanKeep
//
//  Created by MacMini on 01/06/2025.
//

import SwiftUI

class loginScreenViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isChecked : Bool = false
    @Published var isNavtoForgotPassword : Bool = false
//    @Published var 
}

struct LoginScreen: View {
    @StateObject var viewmodel = loginScreenViewModel()
    @State private var isPressed: Bool = false
    @State private var isPressed1: Bool = false
    @State private var isTrue : Bool = false
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 11) {
                    Text("Log into your account!")
                        .font(.system(size: 32, weight: .medium))
                    
                    Text("Welcome back! Let’s pick up right where you stopped.")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 20))
                       
                    TextfieldItem(placeholder: "Email", leadingIcon: Image.appImage.email, variable: $viewmodel.email)
                       // .padding(.horizontal,1)
                        .padding(.top,34)
                    HStack {
                        PasswordFieldView(placeholder: "Password", leadingIcon: Image.appImage.lock, value: $viewmodel.password)
                        Button(action: {
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 59, height: 57)
                                Image.appImage.faceid
                            }
                        }
                    }
                    //.padding(.horizontal,1)
                    .padding(.top,5)
                    HStack {
                        Image(systemName: viewmodel.isChecked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(viewmodel.isChecked ? Color.theme.appprimary : Color.secondary)
                            .onTapGesture {
                                self.viewmodel.isChecked.toggle()
                            }
                            .padding(.leading,1)
                        Text("Remember me")
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 19))
                        Spacer()
                        Button(action: {
                            viewmodel.isNavtoForgotPassword = true
                        }, label: {
                            Text("Forgot password?")
                                .font(.system(size: 19))
                                .foregroundStyle(Color.theme.appprimary)
                                .underline()
                        })
                    }
                    .padding(.top,32)
                    //.padding(.horizontal,1)
                    PrimaryButtonView(
                        action: {
                            
                        },
                        title: "Login",
                        isEnabled: !viewmodel.email.isEmpty && !viewmodel.password.isEmpty
                    )
                    .padding(.top, 30)
                    HStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1)
                        Text("Or")
                            .font(.system(size: 19))
                            .padding(.horizontal, 1)
                            .background(Color.white)
                            .foregroundColor(.gray)
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1)
                    }
                    .padding(.top,30)
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed = false
                        }
                    } label: {
                        HStack (spacing:0){
                            Image.appImage.google
                            
                            Text("Login with Google")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 19))
                                .padding(.leading,10)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .opacity(isPressed ? 0.4 : 1.0)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                     .contentShape(Rectangle())
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
                    .padding(.top,42)
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed1 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed1 = false
                        }
                    } label: {
                        HStack (spacing:0){
                            Image.appImage.apple
                            
                            Text("Login with Apple")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 19))
                                .padding(.leading,10)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .opacity(isPressed1 ? 0.4 : 1.0)

                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.black.opacity(0.8)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(13)
                    .padding(.top,10)
                    .scaleEffect(isPressed1 ? 0.95 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed1)
                }
                .padding(.horizontal,5)
                .padding(.top,70)
          
            }
            
        }
        .padding()
        .ignoresSafeArea()
        .navigationDestination(isPresented: $viewmodel.isNavtoForgotPassword) {
            ForgotPasswordScreen()
        }
    }
}
#Preview {
    LoginScreen()
}

