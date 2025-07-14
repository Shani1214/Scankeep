//
//  ReceiptDetails.swift
//  ScanKeep
//
//  Created by MacMini on 08/06/2025.
//

import SwiftUI

struct ReceiptDetails: View {
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Mapleview Mall")
                        .font(.system(size: 21))
                        .bold()
                        .hLeading()
                        .padding(.leading,10)
                        .padding(.top,20)
                    Text("1200 Maple Street, Midtown City, 65732")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.leading,10)
                        .padding(.top,8)
                    
                    Divider().padding(.horizontal,20)
                    
                    Text("Date: 13 May 2025 | 2:37 PM")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.leading,10)
                        .padding(.top,8)
                    
                    Text("Transaction ID: #MV472839")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.leading,10)
                        .padding(.top,4)
                    
                    Divider().padding(.horizontal,20)
                    
                    Text("1x Leather Tote Bag")
                        .font(.system(size: 21))
                        .hLeading()
                        .padding(.leading,10)
                    
                    HStack {
                        Text("Genuine leather, tan brown")
                            .font(.system(size: 19))
                            .foregroundStyle(Color.gray)
                            .hLeading()
                            .padding(.leading,10)
                        
                        Text("$89.99")
                            .font(.system(size: 19))
                            .padding(.trailing,10)
                    }
                    
                    Text("Classic Collection")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.leading,10)
                    
                    Text("1x Hardcover Novel")
                        .font(.system(size: 21))
                        .hLeading()
                        .padding(.leading,10)
                        .padding(.top,10)
                    
                    HStack {
                        Text("“Winds of the North” by Helen")
                            .font(.system(size: 19))
                            .foregroundStyle(Color.gray)
                            .hLeading()
                            .padding(.leading,10)
                        
                        Text("$89.99")
                            .font(.system(size: 19))
                            .padding(.trailing,10)
                    }
                    
                    Text("M. Cross")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray)
                        .hLeading()
                        .padding(.leading,10)
                    
                    Divider().padding(.horizontal,20)
                    
                    VStack {
                        HStack {
                            Text("Subtotal")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 19))
                                .hLeading()
                                .padding(.leading,10)
                            
                            Text("$114.49")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 19))
                                .padding(.trailing,10)
                        }
                        .padding(.top,10)
                        
                        HStack {
                            Text("Tax (6%): ")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 19))
                                .hLeading()
                                .padding(.leading,10)
                            
                            Text("$114.49")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 19))
                                .padding(.trailing,10)
                        }
                        .padding(.top,10)
                        
                        HStack {
                            Text("Total:")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 21))
                                .hLeading()
                                .padding(.leading,10)
                            
                            Text("$121.25")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 25))
                                .padding(.trailing,10)
                        }
                        .padding(.top,10)
                        .padding(.bottom,20)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 1)
                .padding(.horizontal,1)
                .padding(.top,100)
                HStack {
                    Text("Category")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 19))
                        .hLeading()
                        .padding(.leading,10)

                    Text("Shopping")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 19))
                        .padding(.trailing,10)
                }
                .padding(.top,10)

                HStack {
                    Text("Date")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 19))
                        .hLeading()
                        .padding(.leading,10)

                    Text("13th may 2025")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 19))
                        .padding(.trailing,10)
                }
                .padding(.top,10)
                HStack {
                    Text("Total:")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 21))
                        .hLeading()
                        .padding(.leading,10)
                    
                    Text("$121.36")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 25))
                        .padding(.trailing,10)
                }
                .padding(.top,10)
            }
        }
        
        .padding()
        .navigationTitle("Receipt details")
        .font(.system(size: 24))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }) {
                    Image.appImage.trash
                }
            }
        }
        .toolbarRole(.editor)
        .ignoresSafeArea()

    }
}

#Preview {
    ReceiptDetails()
}
