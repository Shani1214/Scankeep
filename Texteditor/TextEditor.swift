import SwiftUI


struct DescriptionTextEditor: View {
    var placeholder: String
    @Binding var value: String
    @FocusState private var isFocused: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {

            TextEditor(text: $value)
                .padding(.leading, 39)
                .padding(.top, 8)
                .padding(.trailing, 8)
                .foregroundStyle(Color.black)
                .font(.custom("Urbanist-Regular", size: 15))
                .lineSpacing(5)  
                .scrollContentBackground(.hidden)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(isFocused ? Color.blue : Color.gray)
                )
                .focused($isFocused)

            Image.appImage.email
                .resizable()
                .frame(width: 22,height: 24)
                .padding(.leading, 11)
                .padding(.top, 13)

            if value.isEmpty {
                Text(placeholder)
                    .foregroundStyle(Color.gray.opacity(0.6))
                    .font(.system(size: 15))
                    .padding(.leading, 42)
                    .padding(.top, 14)
            }
        }
    }
}



#Preview {
    DescriptionTextEditor(placeholder: "Enter description", value: .constant(""))
        .padding()
        .previewLayout(.sizeThatFits)
}
