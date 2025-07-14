import SwiftUI

struct Delete_Account: View {
    @State private var selectedReason: String? = nil
    @State private var password : String = ""
    @FocusState private var focusedField: Field?
    @State private var isaccountdeleted : Bool = false
    enum Field: Hashable {
        case password
    }

    let reasons = [
        "I am no longer using my account",
        "I have privacy concerns",
        "I found a better app",
        "I created a duplicate account",
        "The app is not useful to me",
        "Other"
    ]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Delete Account")
                        .font(.system(size: 32))
                    Text("""
we’re really sorry to see you go. Are
you sure you want to delete your account? Once you confirm, your data will be gone.
""")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray)

                    ForEach(reasons, id: \.self) { reason in
                        HStack {
                            Image(systemName: selectedReason == reason ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(selectedReason == reason ? .green : .gray)

                            Text(reason)
                                .font(.system(size: 18))
                                .foregroundColor(.primary)

                            Spacer() // Optional: pushes content to the left
                        }
                        .padding(.vertical, 1) // Optional: better tap target
                        .contentShape(Rectangle()) // Makes the whole row tappable
                        .onTapGesture {
                            selectedReason = reason
                        }
                    }
                    .padding(.top,1)
                    HStack {
                        PasswordFieldView(placeholder: "Password", leadingIcon: Image.appImage.lock, value: $password)                        .frame(width: 310)
                        .focused($focusedField, equals: .password)
                        Button(action: {
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 53, height: 57)
                                Image.appImage.faceid
                            }
                        }
                    }
                    .padding(.top,20)
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                           isaccountdeleted = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isaccountdeleted  = false
                       
                        }
                    } label: {
                        HStack {
                            Text("Delete my account")
                                .foregroundStyle(Color.white)
                                .opacity(isaccountdeleted   ? 0.4 : 1.0)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.theme.appred)
                        .cornerRadius(13)
                    }  .scaleEffect(   isaccountdeleted  ? 0.95 : 1.0) // Press animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value:    isaccountdeleted )
                        .padding(.top,10)
                }
                .padding()
             
            }
         
        }
        .navigationTitle("Delete Account")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    Delete_Account()
}
