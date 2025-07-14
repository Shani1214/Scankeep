import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.6
    @State private var navigateToOnboarding = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.appprimary
                    .ignoresSafeArea()

                Text("Scankeep")
                    .foregroundStyle(Color.white)
                    .font(Font.custom("interfont.ttf", size: 43))
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.6)) {
                            scale = 1.0
                        }

                        // Navigate after 3 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            navigateToOnboarding = true
                        }
                    }

                // Navigation trigger
                    .navigationDestination(isPresented: $navigateToOnboarding){
                        OnBoardingScreen()
                    }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
