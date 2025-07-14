//
//  ForgotPasswordScreen.swift
//  ScanKeep
//
//  Created by MacMini on 03/06/2025.
//

import SwiftUI
class ForgotPasswordViewodel : ObservableObject {
    @Published var email : String = ""
    @Published var isSubmitCodeScreen : Bool = false
}
struct ForgotPasswordScreen: View {
    @StateObject var viewmodel = ForgotPasswordViewodel()
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing:5){
                Text("Forgot password?")
                    .font(.system(size: 32))
                Text("Can’t remember it? We’ve got your back.")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray)
                TextfieldItem(placeholder: "Email", leadingIcon: Image.appImage.email, variable: $viewmodel.email)
                    .padding(.top,44)
                PrimaryButtonView(
                    action: {
                        viewmodel.isSubmitCodeScreen = true
                    },
                    title: "Submit email",
                    isEnabled: !viewmodel.email.isEmpty
                )
                .padding(.top, 25)
            }
            .padding()
            .navigationDestination(isPresented: $viewmodel.isSubmitCodeScreen) {
                SubmitCodeScreen()
            }
        }
    }
}

#Preview {
    ForgotPasswordScreen()
}
