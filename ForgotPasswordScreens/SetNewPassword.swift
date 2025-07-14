import SwiftUI

class SetNewPasswordViewModel: ObservableObject {
    @Published var newpassword: String = ""
    @Published var confirmnewpassword: String = ""

    func hasUppercase(_ text: String) -> Bool {
        text.range(of: "[A-Z]", options: .regularExpression) != nil
    }

    func hasMinimumLength(_ text: String) -> Bool {
        text.count >= 8
    }

    func hasNumber(_ text: String) -> Bool {
        text.range(of: "[0-9]", options: .regularExpression) != nil
    }
}

struct SetNewPassword: View {
    @StateObject var viewmodel = SetNewPasswordViewModel()
    @FocusState private var focusedField: Field?

    enum Field: Hashable {
        case newPassword, confirmPassword
    }

    var activeText: String {
        switch focusedField {
        case .newPassword:
            return viewmodel.newpassword
        case .confirmPassword:
            return viewmodel.confirmnewpassword
        default:
            return ""
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Set a new password")
                    .font(.system(size: 32))

                Text("Set a new password you’ll remember.")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))

                // New Password Field
                PasswordFieldView(
                    placeholder: "New Password", leadingIcon: Image.appImage.lock,
                    value: $viewmodel.newpassword
                )
                .focused($focusedField, equals: .newPassword)

                // Confirm Password Field
                PasswordFieldView(placeholder: "Confirm New Password", leadingIcon: Image.appImage.lock, value: $viewmodel.confirmnewpassword)
                .focused($focusedField, equals: .confirmPassword)
                .padding(.top, 10)

                VStack(alignment: .leading, spacing: 6) {
                    PasswordRuleView(
                        text: "At least 1 uppercase letter",
                        isValid: viewmodel.hasUppercase(activeText)
                    )
                    PasswordRuleView(
                        text: "At least 8 characters",
                        isValid: viewmodel.hasMinimumLength(activeText)
                    )
                    PasswordRuleView(
                        text: "At least 1 number",
                        isValid: viewmodel.hasNumber(activeText)
                    )
                }
                .padding(.top, 16)
                .font(.system(size: 14))
                PrimaryButtonView(
                    action: {
                    },
                    title: "Continue to Dashboard",
                    isEnabled: !viewmodel.newpassword.isEmpty && !viewmodel.confirmnewpassword.isEmpty && viewmodel.newpassword == viewmodel.confirmnewpassword
                )
                .padding(.top, 30)
            }
            .padding()
            
        }
    }
}

struct PasswordRuleView: View {
    var text: String
    var isValid: Bool

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: isValid ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isValid ? .green : .gray)
                .font(.system(size: 14))
            Text(text)
                .foregroundColor(isValid ? .green : .gray)
        }
    }
}
#Preview {
    SetNewPassword()
}
