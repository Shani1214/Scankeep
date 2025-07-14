//
//  ScanReceiptOCR.swift
//  ScanKeep
//
//  Created by MacMini on 05/06/2025.
//

import SwiftUI

class ScanReceiptViewModel : ObservableObject {
    let defaultCategories = ["Shopping", "Food", "Fuel", "Travel"]
    @Published var customCategories: [String] = []
    @Published var selectedCategory: String = ""

    var allCategories: [String] {
        return defaultCategories + customCategories
    }
}

struct ScanReceiptOCR: View {
    @StateObject var viewmodel = ScanReceiptViewModel()
    @State private var isPressed: Bool = false
    @State private var isPressed1: Bool = false
    @State private var isPressed2 : Bool = false
    @State private var isPressed3 : Bool = false
    @State private var showSheet = false
    @State private var tempSelectedCategory: String = ""
    @State private var showCustomCategorySheet = false
    @State private var showSuccessSheet = false

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                isPressed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressed = false
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .stroke(Color.gray)
                                    .frame(width: 50, height: 48)
                                Image.appImage.receiptscanner
                            }
                            .opacity(isPressed ? 0.4 : 1.0)
                        }
                        .hLeading()
                        .scaleEffect(isPressed ? 1.0 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)

                        SaveButtonView(action: {
                            showSuccessSheet = true
                        }, title: "Save", isEnabled: !viewmodel.selectedCategory.isEmpty)
                        .padding(.trailing, 3)
                    }

                    VStack(alignment: .leading) {
                        Text("Mapleview Mall")
                            .font(.system(size: 21))
                            .bold()
                            .hLeading()
                            .padding(.leading,10)
                            .padding(.top,40)

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
                    .padding(.top,20)
                }

                HStack(spacing:10) {
                    HStack {
                        TextField("Categories", text: $viewmodel.selectedCategory)
                            .padding(.horizontal,15)
                            .disabled(true)

                        Button {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                isPressed1 = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressed1 = false
                                showSheet = true
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                                .opacity(isPressed1 ? 0.4 : 1.0)
                        }
                        .scaleEffect(isPressed1 ? 0.95 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed1)

                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color.gray)
                    )

                    Spacer()

                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed2 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed2 = false
                            showCustomCategorySheet = true
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.theme.appprimary)
                                .frame(width: 50, height: 50)
                            Image.appImage.plus
                        }
                        .opacity(isPressed2 ? 0.4 : 1.0)
                    }
                    .scaleEffect(isPressed2 ? 1.0 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed2)
                }
                .padding(.top,30)
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
                    Text("Total")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 19))
                        .hLeading()
                        .padding(.leading,10)

                    Text("$121.36")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 19))
                        .padding(.trailing,10)
                }
                .padding(.top,10)
            }
        }

        .sheet(isPresented: $showSheet) {
            VStack(spacing: 20) {
                HStack {
                    Text("Categories")
                        .font(.system(size: 27))
                    Spacer()
                    Button(action: {
                        showSheet = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                    .hTrailing()
                }
                .padding(.top,18)

                Divider()
                    //.padding(.horizontal,3)

                List {
                    ForEach(viewmodel.defaultCategories, id: \.self) { category in
                        categoryRow(category)
                    }

                    ForEach(viewmodel.customCategories, id: \.self) { category in
                        categoryRow(category)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let deletedCategory = viewmodel.customCategories[index]
                            viewmodel.customCategories.remove(at: index)

                           
                            if tempSelectedCategory == deletedCategory {
                                tempSelectedCategory = ""
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)

                Spacer()

                PrimaryButtonView(action: {
                    viewmodel.selectedCategory = tempSelectedCategory
                    showSheet = false
                }, title: "Confirm", isEnabled: true)
            }
          
            .padding(.horizontal,20)
            .padding(.top)
             
            .presentationDetents([.height(530)])
        }

        .sheet(isPresented: $showCustomCategorySheet) {
            CreateCustomCategorySheet(isPresented: $showCustomCategorySheet, categories: $viewmodel.customCategories)
        }
        .sheet(isPresented: $showSuccessSheet) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    Image.appImage.congratssheetimage
                        .hLeading()
                        .padding(.leading,5)

                    Spacer()
                }
                Text("Saved")
                    .font(.system(size: 28))
                    .hLeading()
                    .padding(.leading,20)
                    .padding(.top,10)
                Text("The receipt has been saved.")
                    .font(.system(size: 28))
                    .foregroundStyle(Color.gray)
                VStack(spacing: 16) {
                    PrimaryButtonView(action: {
                       
                    }, title: "Done", isEnabled: true)

                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed3 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed3 = false
                        }                    }) {
                        Text("View Receipt")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .opacity(isPressed3 ? 0.4 : 1.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.theme.appprimary, lineWidth: 1)
                            )
                            
                    }
                        .scaleEffect(isPressed3 ? 1.0 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed3)
                }
                .padding(.horizontal)

               
            }
            .padding()
            .presentationDetents([.height(500)])
        }


        .padding(.horizontal,20)
    }

    @ViewBuilder
    private func categoryRow(_ category: String) -> some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 48, height: 48)

                Image.appImage.shopping
                    .padding(.leading, 2)
            }

            Text(category)
                .font(.system(size: 18))

            Spacer()

            Button(action: {
                tempSelectedCategory = category
            }) {
                Image(systemName: tempSelectedCategory == category ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(tempSelectedCategory == category ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 8)
    }
}

struct CreateCustomCategorySheet: View {
    @Binding var isPresented: Bool
    @Binding var categories: [String]
    @State private var customCategory: String = ""

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Create custom category")
                    .font(.system(size: 27))
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
                .hTrailing()
            }
            .padding(.top,20)

            TextField("Title", text: $customCategory)
                .padding(.horizontal,15)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))

            Spacer()

            PrimaryButtonView(action: {
                if !customCategory.trimmingCharacters(in: .whitespaces).isEmpty {
                    categories.append(customCategory)
                    isPresented = false
                }
            }, title: "Save", isEnabled: !customCategory.isEmpty)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
        }
        .padding()
        .presentationDetents([.height(300)])
    }
}

#Preview {
    ScanReceiptOCR()
}
