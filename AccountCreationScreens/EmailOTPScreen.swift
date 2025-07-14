import SwiftUI

class EmailOTPViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var remainingSeconds: Int = 120
    @Published var isResendEnabled: Bool = false
    @Published var showSheet = false
   
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

struct EmailOTPScreen: View {
    @StateObject var viewmodel = EmailOTPViewModel()

    var body: some View {
        VStack{
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Let’s verify your email")
                        .font(.system(size: 32))
                    
                    Text("We just need to make sure this email belongs to you.")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                    
                    OTPFieldView(numberOfFields: 5, otp: $viewmodel.otp)
                        .padding(.top, 24)
                        
                    
                    PrimaryButtonView(
                        action: {
                            viewmodel.showSheet = true // Show the bottom sheet
                        },
                        title: "Verify",
                        isEnabled: !viewmodel.otp.isEmpty
                    )
                    .padding(.top, 30)
                    
                    if !viewmodel.isResendEnabled {
                        Text(formatTime(viewmodel.remainingSeconds))
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
                                .foregroundStyle(viewmodel.isResendEnabled ? Color.theme.appprimary : .gray)
                                .underline()
                        }
                        .padding(.leading, 5)
                        .disabled(!viewmodel.isResendEnabled)
                    }
                    .padding(.top, 10)
                }
                .padding()
                
            }
        }
        .sheet(isPresented: $viewmodel.showSheet) {
            SuccessBottomSheet()
                .interactiveDismissDisabled(true)
        }
        .presentationDetents([.medium]) // ✅ Ensures dimmed background
    }

    private func formatTime(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}


#Preview {
    EmailOTPScreen()
}

//Bottom Sheet View
struct SuccessBottomSheet: View {
    @State private var isNavtoHomeScreen: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image.appImage.congratssheetimage
                .hLeading()
                .padding(.leading, 5)

            Text("Verification successful!")
                .font(.system(size: 28))

            Text("All set! Your email is verified and your dashboard is ready.")
                .font(.subheadline)
                .foregroundColor(.gray)


            PrimaryButtonView(action: {
                isNavtoHomeScreen = true
            }, title: "Continue to dashboard", isEnabled: true)
          //  .padding(.horizontal)
            .padding(.top,24)
        }
        .padding()
        .presentationDetents([.medium])
        .fullScreenCover(isPresented:$isNavtoHomeScreen ){
            NavigationStack {
                MainTabView()
            }
        }
    }
}
