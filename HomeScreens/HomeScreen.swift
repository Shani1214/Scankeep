//
//  HomeScreen.swift
//  ScanKeep
//
//  Created by MacMini on 04/06/2025.
//

import SwiftUI

class HomeScreenViewModel : ObservableObject {
    @Published var isBalanceVisible = true
    @Published var showDatePickerSheet = false
    @Published var selectedDate = Date()
    @Published var isOn: Bool = false
    @Published var isNavtoReceiptDetails : Bool = false
    @Published var receipts: [ReceiptModel] = [
         ReceiptModel(title: "Shopping", date: "3rd March 2025", amount: "$200.00"),
         ReceiptModel(title: "Groceries", date: "4th March 2025", amount: "$150.00"),
         ReceiptModel(title: "Bills", date: "5th March 2025", amount: "$90.00"),
         ReceiptModel(title: "Fuel", date: "6th March 2025", amount: "$60.00"),
         ReceiptModel(title: "Dining", date: "7th March 2025", amount: "$70.00")
     ]

    @Published var categories: [String] = ["All", "Shopping", "Food", "Fuel"]
        @Published var selectedCategory: String = "All"
    @Published var all_receipts: [String] = []
        func addCategory(_ name: String) {
            categories.append(name)
        }
    func deleteReceipt(at offsets: IndexSet) {
            receipts.remove(atOffsets: offsets)
        }
}
struct HomeScreen: View {
    @StateObject var viewmodel = HomeScreenViewModel()
    @State private var isPressed = false
    var body: some View {
        VStack {
            Text("Scankeep")
                .foregroundStyle(Color.theme.appprimary)
                .font(.system(size: 26))
                .hLeading()
             
           
                VStack(alignment: .leading) {
                    HStack (spacing:10){
                        Text("This Month")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.gray)
                        Button(action: {
                            viewmodel.showDatePickerSheet.toggle()
                        }) {
                            Circle()
                                .fill(Color.theme.appprimary)
                                .frame(width: 20, height: 20)
                                .overlay (
                                    Image(systemName: viewmodel.showDatePickerSheet ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 7, height: 5)
                                )
                        }
                    }
                
                    .padding(.top,25)
                    HStack {
                        if viewmodel.isBalanceVisible {
                            Text("$20000.00")
                                .font(.system(size: 35))
                              
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Text("$******")
                                .font(.system(size: 35))
                               
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .tracking(10)
                        }
                        Button(action: {
                            viewmodel.isBalanceVisible.toggle()
                        }) {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 35, height: 35)
                                .overlay(
                                    (viewmodel.isBalanceVisible ? Image.appImage.eye : Image.appImage.eyeslash)
                                        .frame(width: 21, height: 17)
                                )
                        }
                        .hLeading()
                    }
                    Text("8 receipts")
                        .foregroundStyle(Color.gray)
                   
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isPressed = false
                            // Your actual action here
                            viewmodel.isNavtoReceiptDetails = true
                        }
                    } label: {
                        HStack(spacing: 10) {
                            Image.appImage.plus
                                
                            Text("Add Receipt")
                                .foregroundStyle(Color.white)
                        }
                        .frame(maxWidth: .infinity)
                        .opacity(isPressed ? 0.4 : 1.0)
                    }
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.appprimary)
                    .cornerRadius(13)
            
                    .scaleEffect(isPressed ? 0.95 : 1.0) // Press animation
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
                    HStack {
                        Button {
                        } label: {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.black.opacity(0.8)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(width: 48, height: 48)
                                .cornerRadius(30)
                               // .padding(.leading,10)
                                Image.appImage.autosorting
                                    //.padding(.leading,10)
                            }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Auto sorting")
                                .font(.system(size: 18))
                            Text("Activate smart receipt sorting")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Toggle("", isOn: $viewmodel.isOn)
                            .labelsHidden() // hides default toggle label
                          //  .padding()
                    }
                    .padding(.top,10)
                    HStack {
                        Text("Receipts")
                            .font(.system(size: 20))
                        Spacer()
                        Button {
                        } label: {
                            Text("See all")
                                .foregroundStyle(Color.theme.appprimary)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .foregroundStyle(Color.theme.appprimary)
                                .frame(width: 10, height: 14)
                        }
                    }
                   
                    .padding(.top,10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewmodel.categories, id: \.self) { category in
                                Text(category)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity)
                                   
                                    .background(
                                        viewmodel.selectedCategory == category ?
                                        Color.theme.appprimary : Color.clear
                                    )
                                    .foregroundColor(
                                        viewmodel.selectedCategory == category ? .white : .black
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(viewmodel.selectedCategory == category ? Color.clear : Color.black, lineWidth: 1)
                                    )
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        viewmodel.selectedCategory = category
                                    }
                            }
                        }
                        //.padding(.leading)
                    
                    }
                  
                }
                .navigationDestination(isPresented: $viewmodel.isNavtoReceiptDetails) {
                    ReceiptDetails()
                }
                .sheet(isPresented: $viewmodel.showDatePickerSheet) {
                    VStack(spacing: 20) {
                        Button(action: {
                            viewmodel.showDatePickerSheet = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                            
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .hTrailing()
                        .padding(.trailing,30)
                        .padding(.top,35)
                        DatePicker("", selection: $viewmodel.selectedDate, displayedComponents: [.date])
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .environment(\.locale, Locale(identifier: "en_US"))
                            
                        
                        PrimaryButtonView(action: {
                            viewmodel.showDatePickerSheet = false
                        }, title: "Confirm", isEnabled: true)
                        .padding(.horizontal,16)
                    }
                    .interactiveDismissDisabled(true)
                    .presentationDetents([.medium])
                }
                if viewmodel.receipts.isEmpty {
                                        VStack {
                                            Image.appImage.character
                                                .padding(.top, 40)
                                            Text("Oops! we couldn’t find any receipt.")
                                                .font(.system(size: 17))
                                                .foregroundStyle(Color.gray)
                                            Text("Add one to get started")
                                                .font(.system(size: 17))
                                                .foregroundStyle(Color.gray)
                       }
                                        .padding(.top,15)
                } else {
                    NavigationView {
                        List {
                            ForEach(viewmodel.receipts) { item in
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 48, height: 48)
                                     
                                        Image.appImage.shopping// Replace with your image
                                            .padding(.leading, 2)
                                    }
                                    
                                    
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(item.title)
                                            .bold()
                                            .font(.system(size: 18))
                                        Text(item.date)
                                            .font(.system(size: 18))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount)
                                        .font(.system(size: 18))
                                        .bold()
                                }
                                //.padding(.vertical, 5)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        if let index = viewmodel.receipts.firstIndex(where: { $0.id == item.id }) {
                                            viewmodel.deleteReceipt(at: IndexSet(integer: index))
                                        }
                                    } label: {
                                        Image.appImage.deleteicon
                                       
                                    }
                                    .tint(.red)
                                }
                                .listRowInsets(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 0))
                            }
                        }
                        .listStyle(.plain)
                      
                    }
                    

                }
             
            
        }
     
        .padding()
        .ignoresSafeArea()
    }
}
#Preview {
    HomeScreen()
}
