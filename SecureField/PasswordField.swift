import SwiftUI

struct PasswordFieldView: View {
    var placeholder: String
    var leadingIcon: Image? = nil
    @Binding var value: String
    @State private var showPassword: Bool = false
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 8) {
            // Leading icon if provided
            if let icon = leadingIcon {
                icon
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 15)
            }

            // TextField or SecureField
            Group {
                if showPassword {
                    TextField(placeholder, text: $value)
                } else {
                    SecureField(placeholder, text: $value)
                }
            }
            .padding(.vertical, 10)
           // .padding(.leading, leadingIcon == nil ? 10 : 0)
            .padding(.trailing, 5)
            .font(.system(size: 15))
            .focused($isFocused)

            Button(action: {
                showPassword.toggle()
            }) {
                (showPassword
                 ? Image.appImage.grayeye
                 : Image.appImage.grayeyeslash)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .opacity(1)
            }
            .padding(.trailing, 15)

                   
            
        }
        .frame(height: 57)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? Color.blue : Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}
