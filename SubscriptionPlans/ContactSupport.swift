//
//  ContactSupport.swift
//  ScanKeep
//
//  Created by MacMini on 10/06/2025.
//

import SwiftUI
class ContactSupportViewModel : ObservableObject {
    @Published var message : String = ""
    @Published var issue : String = ""
    @Published var isFacebookPressed : Bool = false
    @Published var isInstagramPressed : Bool = false
    @Published var isTwitterPressed : Bool = false
    @Published var isTelegramPressed : Bool = false
    @Published var isWhtaAppPressed : Bool = false
    @Published var showMessageSheet : Bool = false
}
struct ContactSupport: View {
    @StateObject var viewmodel = ContactSupportViewModel()
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Hi Ali ! How are you ")
                    Text("""
                     Fill out the form below, and 
                     our team will get back to 
                     you as soon as possible.
                     """)
                    .font(.system(size: 30))
                    .hLeading()
                    
                    Text("Subject")
                        .font(.system(size: 17))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.top,15)
                    HStack {
                        TextField("Briefly describe your issue", text: $viewmodel.issue)
                            .font(.system(size: 17))
                            .padding(.horizontal, 10)
                            .frame(height: 50)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(isFocused ? Color.blue : Color.gray)
                            )
                            .focused($isFocused)
                    }

                    Text("Message")
                        .font(.system(size: 17))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.top,15)
                    DescriptionTextEditor(placeholder: """
Tell us what’s going wrong or what 
you need help with.
""", value: $viewmodel.message)
                        .frame(height: 156)
                    PrimaryButtonView(action: {
                        viewmodel.showMessageSheet = true
                    }, title: "Submit", isEnabled: !viewmodel.message.isEmpty && !viewmodel.message.isEmpty)
                        .padding(.top,30)
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
                    Text("Contact us via our socials")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .padding(.top,20)
                    HStack   {
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewmodel.isFacebookPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewmodel.isFacebookPressed = false
                           
                            }
                        } label: {
                            Image.appImage.facebook
                                .opacity( viewmodel.isFacebookPressed ? 0.4 : 1.0)
                        }
                        .scaleEffect(viewmodel.isFacebookPressed ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.isFacebookPressed)
                       
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewmodel.isInstagramPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewmodel.isInstagramPressed = false
                           
                            }
                        } label: {
                            Image.appImage.instagram
                                .opacity( viewmodel.isInstagramPressed ? 0.4 : 1.0)
                        }
                        .scaleEffect(viewmodel.isInstagramPressed ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.isInstagramPressed)
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewmodel.isWhtaAppPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewmodel.isWhtaAppPressed = false
                           
                            }
                        } label: {
                            Image.appImage.whatsapp
                                .opacity(  viewmodel.isWhtaAppPressed ? 0.4 : 1.0)
                        }
                        .scaleEffect( viewmodel.isWhtaAppPressed ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:  viewmodel.isWhtaAppPressed)
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewmodel.isTelegramPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewmodel.isTelegramPressed  = false
                           
                            }
                        } label: {
                            Image.appImage.telegram
                                .opacity(  viewmodel.isTelegramPressed  ? 0.4 : 1.0)
                        }
                        .scaleEffect(  viewmodel.isTelegramPressed  ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:   viewmodel.isTelegramPressed )
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                viewmodel.isTwitterPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                viewmodel.isTwitterPressed  = false
                           
                            }
                        } label: {
                            Image.appImage.twitter
                                .opacity(  viewmodel.isTwitterPressed  ? 0.4 : 1.0)
                        }
                        .scaleEffect(  viewmodel.isTwitterPressed  ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:   viewmodel.isTwitterPressed )
                    }
                    .padding(.top,5)
                     
                }
                .padding()
            }
        }
        .navigationTitle("Contact Support")
        .toolbarTitleDisplayMode(.inline)
        .font(.system(size: 24))
        .sheet(isPresented: $viewmodel.showMessageSheet) {
            VStack {
                Button(action: {
                    viewmodel.showMessageSheet = false
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
                    Image.appImage.service
                    Text("""
                        Your message has been 
                        received!
                        """)
                        .font(.system(size: 28))
                        .hLeading()
                       
                        .padding(.top,15)
                    Text("""
Thank you for reaching out. Our support 
team is reviewing your request and will get 
back to you as soon as possible.
""")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                    VStack {
                        PrimaryButtonView(action: {
                            
                        }, title: "Done", isEnabled: true)
                        
                    }
                    .padding(.horizontal,2)
                    .padding(.top,50)
                }
               
            }
            .padding()
            .presentationDetents([.height(540)])
        }

    }
}

#Preview {
    ContactSupport()
}
