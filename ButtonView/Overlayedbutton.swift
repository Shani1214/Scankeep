import SwiftUI
struct Overlayedbutton: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    @State private var isPressed: Bool = false
    var body: some View {
        VStack {
            Button {
               
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
                buttonTapped()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }

            } label: {
             
                Text(buttonTitle)
                    .foregroundStyle(Color.blue)
                    .font(.system(size: 19))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            .opacity(isPressed ? 0.4 : 1.0)
                .frame(height:60)
                .overlay(
                              RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.blue, lineWidth: 1))
                .scaleEffect(isPressed ? 0.95 : 1.0) 
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
               
         
        }
    }
}
struct Overlayedbutton_Previews: PreviewProvider {
    static var previews: some View {
        Overlayedbutton(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}
