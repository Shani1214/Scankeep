import SwiftUI

//struct PrimaryButton: View {
//    let text: String
//    let isEnabled: Bool?
//    let action: () -> Void
//    
//    @State private var isPressed = false
//    
//    var body: some View {
//        let finalIsEnabled = isEnabled ?? true
//        
//        Button(action: {
//            if finalIsEnabled {
//                action()
//            }
//        }) {
//            ZStack {
//                // Background
//                RoundedRectangle(cornerRadius: 13)
//                    .fill(finalIsEnabled ? Color.blue : Color.theme.appprimary.opacity(0.1))
//                
//                // Text with scale animation
//                Text(text)
//                    .foregroundColor(.white)
//                    .scaleEffect(isPressed ? 0.95 : 1.0)
//                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
//            }
//            .frame(height: 50)
//            .disabled(!finalIsEnabled)
//        }
//        scaleEffect(isPressed ? 0.95 : 1.0) // Shrink effect when pressed
//                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
//
//    }
//}
//#Preview {
//    PrimaryButton(text: "Shani", isEnabled: true, action: {})
//}
import SwiftUI

struct PrimaryButtonView: View {
    var action: () -> Void
    var title: String
    let isEnabled: Bool?
    
    @State private var isPressed = false
    
    var body: some View {
        let finalIsEnabled = isEnabled ?? true
        Button {
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                if finalIsEnabled {
                                   action()
                               }
            }
        } label: {
            HStack {
                    
                Text(title)
                    .foregroundStyle(Color.white)
                  
            }
            .frame(maxWidth: .infinity)
            .opacity(isPressed ? 0.4 : 1.0)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(finalIsEnabled ? Color.theme.appprimary : Color.theme.appprimary.opacity(0.2))
        .cornerRadius(13)
        //.padding()
        .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
        .disabled(!finalIsEnabled)
        
//        Button(action: {
//            withAnimation(.easeInOut(duration: 0.1)) {
//                isPressed = true
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                isPressed = false
//                if finalIsEnabled {
//                    action()
//                }
//            }
//        }) {
//            ZStack {
//                // Background
//                RoundedRectangle(cornerRadius: 13)
//                    .fill(finalIsEnabled ? Color.theme.appprimary : Color.gray.opacity(0.3))
//                    .opacity(isPressed ? 0.4 : 1.0)
//                // Text with blink animation
//                Text(title)
//                    .foregroundColor(.white)
//                    .opacity(isPressed ? 0.4 : 1.0)
//               
//                 
//                
//            }
//            .frame(height: 60)
//            
//        }
//        .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
//        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
//        .disabled(!finalIsEnabled)
//        .buttonStyle(PlainButtonStyle()) // 👈 Avoids default tap styling
    }
}


//struct ButtonItemView: View {
//    var buttonTapped: () -> Void
//    var buttonTitle: String
//    @State private var isPressed = false // Animation State
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                withAnimation(.easeInOut(duration: 0.2)) {
//                    isPressed = true
//                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    isPressed = false
//                    buttonTapped()
//                }
//            }) {
//                HStack(spacing:0) {
//                Spacer()
//                    Image.appImage.google
//                    Text(buttonTitle)
//                        .foregroundStyle(Color.black)
//                        .font(.system(size: 17))
////                        .frame(maxWidth: .infinity)
////                        .frame(height: 50)
//                    Spacer()
//                }
//            }
//            
//            .overlay(
//                          RoundedRectangle(cornerRadius: 13)
//                            .stroke(Color.black, lineWidth: 1)
//                          )
//            
//
//            .scaleEffect(isPressed ? 0.95 : 1.0) // Scale down effect
//            .opacity(isPressed ? 0.7 : 1.0) // Opacity change effect
//            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.2), value: isPressed)
//        }
//    }
//}

// Save Button

struct SaveButtonView: View {
    var action: () -> Void
    var title: String
    let isEnabled: Bool?
    
    @State private var isPressed = false
    
    var body: some View {
        let finalIsEnabled = isEnabled ?? true
        Button {
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                if finalIsEnabled {
                                   action()
                               }
            }
        } label: {
            HStack {
                    
                Text(title)
                    .foregroundStyle(Color.white)
                  
            }
            .frame(maxWidth: .infinity)
            .opacity(isPressed ? 0.4 : 1.0)
        }
        .frame(width:103,height: 46)
       
        .background(finalIsEnabled ? Color.theme.appprimary : Color.theme.appprimary.opacity(0.2))
        .cornerRadius(13)
        //.padding()
        .hTrailing()
        .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
        .disabled(!finalIsEnabled)
        
//        Button(action: {
//            withAnimation(.easeInOut(duration: 0.1)) {
//                isPressed = true
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                isPressed = false
//                if finalIsEnabled {
//                    action()
//                }
//            }
//        }) {
//            ZStack {
//                // Background
//                RoundedRectangle(cornerRadius: 13)
//                    .fill(finalIsEnabled ? Color.theme.appprimary : Color.gray.opacity(0.3))
//                    .opacity(isPressed ? 0.4 : 1.0)
//                // Text with blink animation
//                Text(title)
//                    .foregroundColor(.white)
//                    .opacity(isPressed ? 0.4 : 1.0)
//
//
//
//            }
//            .frame(height: 60)
//
//        }
//        .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
//        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
//        .disabled(!finalIsEnabled)
//        .buttonStyle(PlainButtonStyle()) // 👈 Avoids default tap styling
    }
}

