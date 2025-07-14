import SwiftUI

struct TextfieldItem: View {
    var placeholder: String
    var leadingIcon: Image? = nil
    @Binding var variable: String
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 8) {
            if let icon = leadingIcon {
                icon
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 15)
            }

            ZStack(alignment: .trailing) {
                TextField(placeholder, text: $variable)
                  
                    .padding(.vertical, 10)
                    .padding(.trailing, variable.isEmpty ? 15 : 35)
                    .font(.system(size: 15))
                    .focused($isFocused)

                if !variable.isEmpty {
                    Button(action: { variable = "" }) {
                        Image.appImage.crossbutton
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .padding(.trailing, 15)
                    .transition(.opacity)
                }
            }
        }
        .padding(.trailing, 10)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? Color.blue : Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}


struct TextfieldItem_Previews: PreviewProvider {
    @State static var sampleText = ""

    static var previews: some View {
        TextfieldItem(
            placeholder: "Enter name",
            leadingIcon: Image(systemName: "person"),
            variable: $sampleText
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
