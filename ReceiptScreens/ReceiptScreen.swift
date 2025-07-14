//
//  ReceiptScreen.swift
//  ScanKeep
//
//  Created by MacMini on 08/06/2025.
//

import SwiftUI
class ReceiptScreenViewModel : ObservableObject {
    @Published var isPressed : Bool = false
    @Published var isPressed1 : Bool = false
    @Published var isPressed2 : Bool = false
    @Published var isOn : Bool = false
    @Published  var searchText: String = ""
    @Published var showDatePickerSheet : Bool = false
    @Published var selectedDate = Date()
    @Published var isNavtoReceiptdetails : Bool = false

    @Published var receipts: [ReceiptModel] = [
         ReceiptModel(title: "Shopping", date: "3rd March 2025", amount: "$200.00"),
         ReceiptModel(title: "Groceries", date: "4th March 2025", amount: "$150.00"),
         ReceiptModel(title: "Bills", date: "5th March 2025", amount: "$90.00"),
         ReceiptModel(title: "Fuel", date: "6th March 2025", amount: "$60.00"),
         ReceiptModel(title: "Dining", date: "7th March 2025", amount: "$70.00")
     ]

    @Published var findcategory : Bool = false
   
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
struct ReceiptScreen: View {
    @StateObject var viewmodel = ReceiptScreenViewModel()

    var body: some View {
        VStack {
          
                HStack {
                    Text("Receipts")
                        .font(.system(size: 30))
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            viewmodel.isPressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            viewmodel.isPressed = false
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.theme.appprimary)
                                .frame(width: 50, height: 50)
                            Image.appImage.plus
                        }
                        .opacity(viewmodel.isPressed ? 0.4 : 1.0)
                    }
                    .scaleEffect(viewmodel.isPressed ? 1.0 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.isPressed)

                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            viewmodel.isPressed1 = true
                            viewmodel.findcategory = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            viewmodel.isPressed1 = false
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 50, height: 50)
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.black)
                        }
                        .opacity(viewmodel.isPressed1 ? 0.4 : 1.0)
                    }
                    .scaleEffect(viewmodel.isPressed1 ? 1.0 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.isPressed1)
                }
                .padding(.top, 40)

                HStack {
                    Button {} label: {
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.black.opacity(0.8)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(width: 48, height: 48)
                            .cornerRadius(30)
                           
                            Image.appImage.autosorting
                             
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
                        .labelsHidden()
                        .padding(.trailing,2)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewmodel.categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .frame(width: 106)
                                .background(viewmodel.selectedCategory == category ? Color.theme.appprimary : Color.clear)
                                .foregroundColor(viewmodel.selectedCategory == category ? .white : .black)
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
                  
                    .padding(.top, 30)
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
                    .padding(.top, 15)
                } else {
//                    NavigationView {
                        List {
                            ForEach(viewmodel.receipts) { item in
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 48, height: 48)
                                        Image.appImage.shopping
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
                                .padding(.vertical, 5)
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
                            }
                        }
                        .listStyle(.plain)
                        .onTapGesture {
                            viewmodel.isNavtoReceiptdetails = true
                        }
                        
                    
//                }
                
            }
        
        }
        .frame(maxHeight: .infinity)
        .padding()
        .ignoresSafeArea()
        .sheet(isPresented: $viewmodel.findcategory) {
            FindCategorySheet(viewmodel: viewmodel)
        }
        .presentationDetents([.height(580)])
        .navigationDestination(isPresented: $viewmodel.isNavtoReceiptdetails) {
            ReceiptDetails()
        }
//        .sheet(isPresented: $viewmodel.showDatePickerSheet) {
//            DatePickerSheet(viewmodel: viewmodel)
//        }
        
    }
}
struct FindCategorySheet: View {
    @ObservedObject var viewmodel: ReceiptScreenViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Find receipt")
                    .font(.system(size: 27))
                Button(action: {
                    viewmodel.findcategory = false
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
            Divider()

            HStack {
                HStack {
                    TextField("Search...", text: $viewmodel.searchText)
                        .padding(.horizontal, 10)
                     
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .hTrailing()
                            .padding(.trailing, 20)
                    }

                }
                .frame(width: 323, height: 55)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(50)
                Button {
                    viewmodel.showDatePickerSheet = true
                    withAnimation(.easeInOut(duration: 0.1)) {
                        viewmodel.isPressed2 = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        viewmodel.isPressed2 = false
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.theme.appprimary)
                            .frame(width: 50, height: 50)
                        Image.appImage.calendar
                    }
                    .opacity(viewmodel.isPressed2 ? 0.4 : 1.0)
                }
                .scaleEffect(viewmodel.isPressed2 ? 1.0 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewmodel.isPressed2)
            }
            .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewmodel.categories, id: \.self) { category in
                        Text(category)
                           // .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .frame(width: 106)
                            .background(viewmodel.selectedCategory == category ? Color.theme.appprimary : Color.clear)
                            .foregroundColor(viewmodel.selectedCategory == category ? .white : .black)
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
                .padding(.horizontal, 4)
            }
            .padding(.top, 40)

            NavigationView {
                List {
                    ForEach(viewmodel.receipts) { item in
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 48, height: 48)
                                Image.appImage.shopping
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
                        .padding(.vertical, 5)
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
                    }
                }
                .listStyle(.plain)
            }
            
            }
        .presentationDetents([.large])
        
        .padding()
        .sheet(isPresented: $viewmodel.showDatePickerSheet) {
            DatePickerSheet(viewmodel: viewmodel)
        }
     
        }
    }

struct DatePickerSheet: View {
    @ObservedObject var viewmodel: ReceiptScreenViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Filter by date")
                    .font(.system(size: 27))
                Button(action: {
                    viewmodel.showDatePickerSheet = false
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
            .padding()
            .padding(.top,30)
            DatePicker("", selection: $viewmodel.selectedDate, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "en_US"))
                .padding()
            
            PrimaryButtonView(action: {
                // Your confirm logic
                viewmodel.showDatePickerSheet = false
            }, title: "Confirm", isEnabled: true)
            .padding()
        }
        .presentationDetents([.medium])
    }
    
    
}
#Preview {
    ReceiptScreen()
}
