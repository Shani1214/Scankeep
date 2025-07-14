//
//  SubscriptionPlans.swift
//  ScanKeep
//
//  Created by MacMini on 10/06/2025.
//

import SwiftUI

struct SubscriptionPlans: View {
    @State private var isOn : Bool = true
    @State private var selectedPlan: Int? = 1
    var body: some View {
        VStack {
            ScrollView {
                VStack (spacing:-12){
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 45, height: 45)
                            Image.appImage.subscriptionwhite
                        }
                        .padding(.leading,10)
                        Text("You have no active subscription")
                            .font(.system(size: 17))
                            .hLeading()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(50)
                    .padding(.top,50)
                    
                    Text("Choose plan")
                        .font(.system(size: 27))
                        .hLeading()
                        .padding(.top,32)
                    
                    if !isOn {
                        HStack(spacing: 4) {
                            Image.appImage.mostpopular
                            Text("Most Popular")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.black)
                        .cornerRadius(6)
                        .hTrailing()
                        
                    }
                    
                    ZStack(alignment: .topTrailing) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(alignment: .top) {
                                Text("Solo Tracking")
                                Spacer()
                                if !isOn {
                                    Text("Active plan")
                                        .font(.system(size: 14.5))
                                        .foregroundColor(.green)
                                        .frame(width: 90, height: 25)
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(8)
                                        .padding(.top, 5)
                                }
                                VStack(spacing: 5) {
                                    Toggle("", isOn: $isOn)
                                        .labelsHidden()
                                    Text(isOn ? "Monthly" : "Yearly")
                                        .foregroundStyle(Color.gray)
                                        .font(.system(size: 14))
                                }
                            }

                            HStack(spacing: 4) {
                                Text(isOn ? "$7.99" : "$78.99")
                                    .font(.system(size: 27))
                                    .bold()

                                if !isOn {
                                    Text("$95.99")
                                        .foregroundStyle(Color.gray)
                                        .font(.system(size: 20))
                                        .strikethrough()
                                }

                                Text(isOn ? "/month" : "/year")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray)
                            }
                            .padding(.bottom,10)
                            HStack {
                                Image.appImage.checkmark
                                Text("Track your receipt expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17))
                            }
                        }
                        .padding()
                        //.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(height: 176)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(selectedPlan == 1 ? Color.blue : Color.gray)
                            )
                    )
                    .padding(.top,40)
                    .onTapGesture {
                        selectedPlan = 1
                    }
                    VStack {
                        VStack (alignment: .leading) {
                            Text("Business")
                                .font(.system(size: 17))
                            HStack (spacing: 0){
                                Text("$19.99")
                                    .font(.system(size: 27))
                                    .bold()
                                Text("/month")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray)
                            }
                            .padding(.top,5)
                            HStack {
                                Image.appImage.checkmark
                                Text("Manage team expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17))
                            }
                            .padding(.top,5)
                            HStack {
                                Image.appImage.checkmark
                                Text("Manage your business expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17))
                            }
                            .padding(.top,5)
                            HStack {
                                Image.appImage.checkmark
                                Text("""
Add team member for $4.99 per 
user 
""")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17))
                                    .padding(.top,4)
                            }
                            .padding(.top,5)
                        }
                        .padding()
                        .hLeading()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 240)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(selectedPlan == 2 ? Color.blue : Color.gray)
                            )
                    )
                    .padding(.top,22)
                    .onTapGesture {
                        selectedPlan = 2
                    }
                    PrimaryButtonView(action: {}, title: "Start 7 days free trial", isEnabled: selectedPlan != nil)
                        .padding(.top,34)
                }
                .padding(.top,50)
            }
        }
        .padding()
        .ignoresSafeArea()
        .navigationTitle("Subscription")
        .toolbarTitleDisplayMode(.inline)
        .font(.system(size: 24))
        
    }
}

#Preview {
    SubscriptionPlans()
}
