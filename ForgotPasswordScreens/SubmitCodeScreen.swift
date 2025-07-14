import SwiftUI

class SubmitCodeViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var remainingSeconds: Int = 120
    @Published var isResendEnabled: Bool = false
    @Published var isNavtoSetNewPassword : Bool = false
    private var timer: Timer?

    init() {
        startTimer()
    }

    func startTimer() {
        remainingSeconds = 120
        isResendEnabled = false

        timer?.invalidate() // cancel previous timer if any

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.isResendEnabled = true
                self.timer?.invalidate()
            }
        }
    }

    func resendCode() {
        startTimer()
    }

    deinit {
        timer?.invalidate()
    }
}

struct SubmitCodeScreen: View {
    @StateObject var viewmodel = SubmitCodeViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("""
We sent a 5-digit code to 
your email.
""")
                .font(.system(size: 32))
                
                Text("Look out for a 5-digit code in your email")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray)
                
                Text("olaoluwaabijo@gmail.com")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .italic()
                    .padding(.bottom, 16)
                
                OTPFieldView(numberOfFields: 5, otp: $viewmodel.otp)
                    .padding(.bottom, 24)
                
                PrimaryButtonView(
                    action: {
                        viewmodel.isNavtoSetNewPassword = true
                    },
                    title: "Submit email",
                    isEnabled: !viewmodel.otp.isEmpty
                )
                .padding(.top, 10)
                
                if !viewmodel.isResendEnabled {
                    Text((formatTime(viewmodel.remainingSeconds)))
                        .font(.system(size: 16))
                        .foregroundStyle(Color.theme.appprimary)
                        .padding(.top, 8)
                }
                
                HStack(spacing: 0) {
                    Text("Didn't get code?")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 18))
                    
                    Button {
                        viewmodel.resendCode()
                    } label: {
                        Text("Resend Code")
                            .foregroundStyle(viewmodel.isResendEnabled ? .blue : .gray)
                            .underline()
                    }
                    .padding(.leading, 5)
                    .disabled(!viewmodel.isResendEnabled)
                }
                .padding(.top, 10)
            }
            .padding()
            .navigationDestination(isPresented: $viewmodel.isNavtoSetNewPassword) {
                SetNewPassword()
            }
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

#Preview {
    SubmitCodeScreen()
}
