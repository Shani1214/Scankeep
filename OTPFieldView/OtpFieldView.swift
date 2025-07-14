import SwiftUI

struct OTPFieldView: View {
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var otp: String
    @State private var pins: [String]
    
    var numberOfFields: Int
    var fieldsFrame: CGFloat = 55
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    init(numberOfFields: Int, otp: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._otp = otp
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
        self.fieldsFrame = numberOfFields == 6 ? 48 : 54
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                ZStack {
                    Text(pins[index])
                        .foregroundColor(Color.theme.appprimary)
                        .font(.customFont(.urbanistBold, size: 22))
                        .frame(width: fieldsFrame, height: fieldsFrame)
                        .background(pins[index].isEmpty ? Color.gray.opacity(0.2) : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(pins[index].isEmpty ? .clear : Color.theme.appprimary, lineWidth: 1)
                        )
                    
                    TextField("", text: $pins[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .focused($pinFocusState, equals: FocusPin.pin(index))
                        .onChange(of: pins[index]) { _, newValue in
                            handleInputChange(for: index, newValue: newValue)
                        }
                        .onAppear {
                            if index == 0 && otp.isEmpty {
                                pinFocusState = FocusPin.pin(0)
                            }
                        }
                        .foregroundColor(.clear)
                        .accentColor(.clear)
                        .background(Color.clear)
                }
            }
        }
        .onTapGesture {
            let focusIndex = min(otp.count, numberOfFields - 1)
            pinFocusState = FocusPin.pin(focusIndex)
        }
        .onAppear {
            updatePinsFromOTP()
        }
    }
    
    private func handleInputChange(for index: Int, newValue: String) {
        // Allow only numbers
        let filtered = newValue.filter { $0.isNumber }

        if filtered.count == 1 {
            pins[index] = filtered
            if index < numberOfFields - 1 {
                pinFocusState = FocusPin.pin(index + 1)
            }
        } else if filtered.count > 1 {
            let digits = Array(filtered.prefix(numberOfFields - index))
            for (offset, digit) in digits.enumerated() {
                if index + offset < numberOfFields {
                    pins[index + offset] = String(digit)
                }
            }
            let next = index + digits.count
            if next < numberOfFields {
                pinFocusState = FocusPin.pin(next)
            } else {
                hideKeyboard()
            }
        } else {
            pins[index] = ""
            if index > 0 {
                pinFocusState = FocusPin.pin(index - 1)
            }
        }

        updateOTPString()
    }
    
    private func updatePinsFromOTP() {
        let otpArray = Array(otp.prefix(numberOfFields))
        for (index, char) in otpArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateOTPString() {
        otp = pins.joined()
        if otp.count == numberOfFields {
            hideKeyboard()
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    OTPFieldView(numberOfFields: 5, otp: .constant(""))
}
