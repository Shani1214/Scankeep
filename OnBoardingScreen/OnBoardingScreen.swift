//
//  OnBoardingScreen.swift
//  ScanKeep
//
//  Created by MacMini on 01/06/2025.
//

import SwiftUI

struct OnBoardingScreen: View {
    @State private var isNavtoLoginyouraccount : Bool = false
    @State private var isNavtoCreateaccount : Bool = false
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    Image.appImage.ellipse
                    Image.appImage.receipt
                    
                }
                .padding(.top,60)
                VStack (alignment : .leading, spacing: 8) {
                    Text("""
                     Scan and save receipts in
                     seconds
                     """)
                    .font(.system(size: 33))
                    .padding(.top,37)
                    Text("""
                        Just take a picture. We'll extract the details and store them for you
                        """)
                        .foregroundStyle(Color.gray)
                        .font(.custom("interfont.ttf", size: 18))

                    Overlayedbutton(buttonTapped: {
                        isNavtoLoginyouraccount = true
                    }, buttonTitle: "Log into your account")
                        .padding(.top,35)
                        .padding(.horizontal,1)
                    PrimaryButtonView(action: {
                        isNavtoCreateaccount = true
                    }, title: "Create an account", isEnabled: true)
                        .padding(.top,10)
                        
                }
            }
          
    
        }
        .padding()
        .ignoresSafeArea()
        .navigationDestination(isPresented: $isNavtoLoginyouraccount ){
            LoginScreen()
        }
        .navigationDestination(isPresented: $isNavtoCreateaccount) {
            CreateAccountScreen()
        }
    }
}

#Preview {
    OnBoardingScreen()
}
