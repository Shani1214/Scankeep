//
//  CreateAccountScreen.swift
//  ScanKeep
//
//  Created by MacMini on 03/06/2025.
//

import SwiftUI
class CreateAccountViewModel : ObservableObject {
    @Published var fullname : String = ""
    @Published var emailaddress : String = ""
    @Published var createpassword : String = ""
    @Published var isChecked : Bool = false
    @Published var showPolicySheet: Bool = false
    @Published var isNavtoEmailOTPScreen : Bool = false
    @Published var iscreatewithgoogle : Bool = false
    @Published var createwithapple : Bool = false
}
struct CreateAccountScreen: View {
    @StateObject var viewmodel = CreateAccountViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 10) {
            Text("Create an account!")
                .font(.system(size: 32))
            Text("Just a few taps and you're in. Let’s get you set up!")
                .font(.system(size: 20))
                .foregroundStyle(Color.gray)
            TextfieldItem(placeholder: "Full Name", leadingIcon: Image.appImage.profile, variable: $viewmodel.fullname)
                .padding(.top,10)
            TextfieldItem(placeholder: "Email address", leadingIcon: Image.appImage.email
                          , variable: $viewmodel.emailaddress)
            .padding(.top,10)
            PasswordFieldView(placeholder: "Create Password", leadingIcon: Image.appImage.lock, value: $viewmodel.createpassword)
                .padding(.top,10)
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: viewmodel.isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(viewmodel.isChecked ? Color.theme.appprimary : Color.secondary)
                    .onTapGesture {
                        viewmodel.isChecked.toggle()
                    }
                    .padding(.top,11)
                VStack(alignment: .leading, spacing: 4) {
                    Text("By creating an account, you agree to our")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    HStack {
                        Button(action: {
                            viewmodel.showPolicySheet = true
                            
                        }) {
                            Text("Terms of service")
                                .font(.system(size: 17))
                                .foregroundColor(Color.theme.appprimary)
                                .underline()
                        }
                        .contentShape(Rectangle()) // Make entire area tappable
                        .simultaneousGesture(TapGesture().onEnded {
                            //print("Tapped instantly inside ScrollView")
                        })
                        Text("and")
                            .foregroundColor(.gray)
                            .font(.system(size: 17))
                        Button(action: {
                            // Navigate to Privacy Policy
                            viewmodel.showPolicySheet = true
                            
                        }) {
                            Text("Privacy policy")
                                .font(.system(size: 17))
                                .foregroundColor(Color.theme.appprimary)
                                .underline()
                        }
                    }
                    
                }
            }
            .padding(.top,30)
            PrimaryButtonView(
                action: {
                    viewmodel.isNavtoEmailOTPScreen = true
                },
                title: "Create an account",
                isEnabled: !viewmodel.fullname.isEmpty && !viewmodel.emailaddress.isEmpty && !viewmodel.createpassword.isEmpty && viewmodel.isChecked
            )
            .padding(.top,20)
            HStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                Text("Or")
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
                    viewmodel.iscreatewithgoogle = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    viewmodel.iscreatewithgoogle = false
                   
                }
            } label: {
                HStack (spacing:0){
                    Image.appImage.google
                    
                    Text("Create with Google")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 19))
                        .padding(.leading,10)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            // .contentShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
            .scaleEffect(viewmodel.iscreatewithgoogle ? 0.95 : 1.0) // Press animation
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.iscreatewithgoogle)
            .padding(.top,32)
            Button {
                withAnimation(.easeInOut(duration: 0.1)) {
                    viewmodel.createwithapple = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    viewmodel.createwithapple = false
                   
                }
            } label: {
                HStack (spacing:0){
                    Image.appImage.apple
                    
                    Text("Create with Apple")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 19))
                        .padding(.leading,10)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
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
            .scaleEffect(viewmodel.createwithapple ? 0.95 : 1.0) // Press animation
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.createwithapple)
          
            .padding(.bottom,45)
            
        }
        .padding()
        .sheet(isPresented: $viewmodel.showPolicySheet) {
            TermsPrivacySheetView(isPresented: $viewmodel.showPolicySheet)
        }
        .navigationDestination(isPresented: $viewmodel.isNavtoEmailOTPScreen) {
            EmailOTPScreen()
        }
    }
        
    }
}

#Preview {
    CreateAccountScreen()
}
// Bottom Sheet Struct

struct TermsPrivacySheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("""
                     Terms of service & Privacy 
                     policy
                     """)
                    .font(.system(size: 23))
                    .padding(.top,70)
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                           
                            .frame(width: 36, height: 30)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .padding(.bottom,80)
                }
                
                Text("""
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.
                
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.
                """)
                .font(.system(size: 21))
                .foregroundColor(.gray)
                Spacer()
            }
            .padding()
        
        
    }
}

