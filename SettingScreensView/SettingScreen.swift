//
//  SettingScreen.swift
//  ScanKeep
//
//  Created by MacMini on 09/06/2025.
//

import SwiftUI

struct SettingScreen: View {
    @State private var showLogoutSheet : Bool = false
    @State private var isPressed : Bool = false
    @State private var islogoutpressed : Bool = false
    @State private var iscancelpressed : Bool = false
    @State private var isNavtoDeleteAccount : Bool = false
    @State private var isNavtoPersonalInformation : Bool = false
    @State private var isNavtosubcriptionplans : Bool = false
    @State private var isNavtocontactsupport : Bool = false
    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 28))
                .hLeading()
                
            ScrollView {
                VStack {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image.appImage.profileblack
                        }
                        VStack(alignment: .leading, spacing: 3) {
                          Text("Personal Information")
                                .font(.system(size: 20))
                               
                            Text("View your personal information")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray)
                        }
                      
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isNavtoPersonalInformation = true
                    }
                    Divider()
                        .padding(.top,10)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image.appImage.subscription
                        }
                        VStack(alignment: .leading, spacing: 3) {
                          Text("Subscription")
                                .font(.system(size: 20))
                            Text("See subscription plans")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top,15)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isNavtosubcriptionplans = true
                    }

                    Divider()
                        .padding(.top,10)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image.appImage.contactsupport
                        }
                        VStack(alignment: .leading, spacing: 3) {
                          Text("Contact Support")
                                .font(.system(size: 20))
                            Text("Contact us for help or complaints")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray)
                        }
                      
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top,15)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isNavtocontactsupport = true
                    }
                    Divider()
                        .padding(.top,10)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image.appImage.logout
                        }
                        VStack(alignment: .leading, spacing: 3) {
                          Text("Log out")
                                .font(.system(size: 20))
                            Text("Logout of your account")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top,15)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showLogoutSheet = true
                    }
                    Divider()
                        .padding(.top,10)
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                          
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed = false
                            isNavtoDeleteAccount = true
                        }
                    } label: {
                        Text("Delete Account")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.theme.appred)
                            .bold()
                        Text("Dellll")
                    }
                    .padding(.top,20)
                 .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
                }
                .padding(.top,30)
                .navigationDestination(isPresented: $isNavtoDeleteAccount) {
                    Delete_Account()
                }
                .navigationDestination(isPresented: $isNavtoPersonalInformation) {
                    PersonalInformation()
                }
                .navigationDestination(isPresented: $isNavtosubcriptionplans) {
                    SubscriptionPlans()
                }
                .navigationDestination(isPresented: $isNavtocontactsupport) {
                   ContactSupport()
                }
            }
        }
        .padding()
        .sheet(isPresented: $showLogoutSheet) {
            VStack (alignment: .leading){
                Button(action: {
                    showLogoutSheet = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
                .hTrailing()
                VStack(alignment: .leading, spacing: 5) {
                    Image.appImage.loggout
                    Text("Logout?")
                        .font(.system(size: 28))
                        .hLeading()
                        .padding(.top,15)
                    Text("Logout of your account.")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                    
                    VStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                               islogoutpressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                islogoutpressed  = false
                           
                            }
                        } label: {
                            HStack {
                                Text("Log out")
                                    .foregroundStyle(Color.white)
                                    .opacity(islogoutpressed   ? 0.4 : 1.0)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.theme.appred)
                            .cornerRadius(13)
                        }  .scaleEffect(   islogoutpressed  ? 0.95 : 1.0) // Press animation
                            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:    islogoutpressed )
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                               iscancelpressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                iscancelpressed = true
                                showLogoutSheet = false
                            }
                        } label: {
                            HStack {
                                Text("Cancel")
                                    .foregroundStyle(Color.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.gray)
                            )
                        }
                        .scaleEffect(iscancelpressed  ? 0.95 : 1.0) // Press animation
                            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:    iscancelpressed )

                            .padding(.top,15)
                    }
                    //.padding(.horizontal,2)
                    .padding(.top,20)
                }
            }
            .padding(.horizontal,16)
            .presentationDetents([.height(430)])
          
        }
      

    }
}

#Preview {
    SettingScreen()
}
