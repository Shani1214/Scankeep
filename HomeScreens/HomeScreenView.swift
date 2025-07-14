//
//  HomeScreenView.swift
//  ScanKeep
//
//  Created by MacMini on 17/06/2025.
//

import SwiftUI
class HomeeScreenViewModel : ObservableObject {
    @Published var showDatePickerSheet = false
    @Published var selectedDate = Date()
    @Published var isBalanceVisible = true
}
struct HomeScreenView: View {
    @StateObject var viewmodel = HomeeScreenViewModel()

    var body: some View {
        VStack {
            HStack(alignment: .top) {

                // MARK: - First Block
                VStack(alignment: .leading, spacing: 10) {
                    // Title & Toggle
                    HStack(spacing: 10) {
                        Text("This Month")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)

                        Button(action: {
                            viewmodel.showDatePickerSheet.toggle()
                        }) {
                            Circle()
                                .fill(Color.theme.appprimary)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: viewmodel.showDatePickerSheet ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 7, height: 5)
                                )
                        }
                    }

                    // Balance & Eye Button
                    HStack(spacing: 8) {
                        ZStack {
                            Text("$10000.00")
                                .font(.system(size: 25))
                                .frame(width: 130, alignment: .leading)
                                .fixedSize(horizontal: true, vertical: false)
                                .opacity(viewmodel.isBalanceVisible ? 1 : 0)

                            Text("$****")
                                .font(.system(size: 25))
                                .tracking(4)
                                .frame(width: 130, alignment: .leading)
                                .fixedSize(horizontal: true, vertical: false)
                                .opacity(viewmodel.isBalanceVisible ? 0 : 1)
                        }

                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                viewmodel.isBalanceVisible.toggle()
                            }
                        }) {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 35, height: 35)
                                .overlay(
                                    (viewmodel.isBalanceVisible ? Image.appImage.eye : Image.appImage.eyeslash)
                                        .frame(width: 21, height: 17)
                                )
                        }
                        .alignmentGuide(.firstTextBaseline) { $0[.bottom] }
                    }

                    Text("8 receipts")
                        .foregroundStyle(Color.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // MARK: - Divider
                Divider()
                    .frame(height: 96)
                // MARK: - Second Block
                VStack(alignment: .leading, spacing: 10) {
                    // Title & Toggle
                    HStack(spacing: 10) {
                        Text("This Month")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)

                        Button(action: {
                            viewmodel.showDatePickerSheet.toggle()
                        }) {
                            Circle()
                                .fill(Color.theme.appprimary)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: viewmodel.showDatePickerSheet ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 7, height: 5)
                                )
                        }
                    }

                    // Balance & Eye Button
                    HStack(spacing: 8) {
                        ZStack {
                            Text("$20000.00")
                                .font(.system(size: 25))
                                .frame(width: 130, alignment: .leading)
                                .fixedSize(horizontal: true, vertical: false)
                                .opacity(viewmodel.isBalanceVisible ? 1 : 0)

                            Text("$******")
                                .font(.system(size: 25))
                                .tracking(4)
                                .frame(width: 130, alignment: .leading)
                                .fixedSize(horizontal: true, vertical: false)
                                .opacity(viewmodel.isBalanceVisible ? 0 : 1)
                        }

                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                viewmodel.isBalanceVisible.toggle()
                            }
                        }) {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 35, height: 35)
                                .overlay(
                                    (viewmodel.isBalanceVisible ? Image.appImage.eye : Image.appImage.eyeslash)
                                        .frame(width: 21, height: 17)
                                )
                        }
                        .alignmentGuide(.firstTextBaseline) { $0[.bottom] }
                    }

                    Text("30 receipts from team")
                        .foregroundStyle(Color.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal,15)
    }
}

#Preview {
    HomeScreenView()
}
