//
//  NotificationScreen.swift
//  ScanKeep
//
//  Created by MacMini on 09/06/2025.
//

import SwiftUI

struct NotificationScreen: View {
    var body: some View {
        VStack {
           
                Text("Notifications")
                    .font(.system(size: 30))
                    .hLeading()
                    .padding(.top,50)
            ScrollView(showsIndicators: false) {
                Text("Today")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 17))
                    .hLeading()
                    .padding(.top,20)
                VStack {
                ForEach(0 ..< 2) { item in
                    HStack   {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                            Image.appImage.shopping
                            
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Receipt uploaded successfully")
                                .font(.system(size: 18))
                                .lineLimit(1)
                            Text("Your receipt has been scanned and added to your records.")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.gray)
                                .lineLimit(2)
                        }
                    }
                    .hLeading()
                    .padding(.top,20)
                    Divider()
                }
            }
                Text("Yesterday")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 17))
                    .hLeading()
                    .padding(.top,20)
                VStack {
                    ForEach(0 ..< 5) { item in
                        HStack   {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 50, height: 50)
                                Image.appImage.shopping
                                
                            }
                            VStack(alignment: .leading, spacing: 3) {
                                Text("You haven’t scanned in a while")
                                    .font(.system(size: 18))
                                    .lineLimit(1)
                                Text("You haven’t scanned a receipt in a while. Keep your records up to date!")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.gray)
                                    .lineLimit(2)
                            }
                        }
                        .hLeading()
                        .padding(.top,20)
                        Divider()
                    }
                    }
            }
        }
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    NotificationScreen()
}
