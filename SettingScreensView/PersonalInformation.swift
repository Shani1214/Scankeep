import SwiftUI

class PersonalInformationViewModel: ObservableObject {
    @Published var fullname: String = ""
    @Published var emailaddress: String = ""
    @Published var datejoinded: String = ""
    
    @Published var currentpassword: String = ""
    @Published var confirmnewpassword: String = ""
    @Published var isCurrentPasswordVisible : Bool = false
    @Published var isNewPasswordVisible : Bool = false
    @Published var showPasswordSheet : Bool = false
    @Published var passwordchangedsheet : Bool = false
}

struct PersonalInformation: View {
    @StateObject var viewmodel = PersonalInformationViewModel()
    
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false){
                            VStack {
                                // Header Profile
                                HStack {
                                    Button {
                                        // Add image or edit action
                                    } label: {
                                        ZStack {
                                            Image.appImage.larry
                                            Circle()
                                                .stroke(Color.white)
                                                .frame(width: 26, height: 26)
                                                .padding(.top, 60)
                                            Circle()
                                                .fill(Color.theme.appprimary)
                                                .frame(width: 26, height: 26)
                                                .padding(.top, 60)
                                            Image(systemName: "plus")
                                                .resizable()
                                                .foregroundStyle(Color.white)
                                                .frame(width: 17, height: 17)
                                                .padding(.top, 60)
                                        }
                                    }

                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Larry Simons")
                                            .font(.system(size: 19))
                                        Text("larrysimons@gmail.com")
                                            .font(.system(size: 19))
                                            .foregroundStyle(Color.gray)
                                        Text("Joined 7th April 2025")
                                            .font(.system(size: 19))
                                            .foregroundStyle(Color.gray)
                                    }
                                    .padding(.top, 20)
                                    .padding(.leading, 15)
                                }
                                .hLeading()
                              
                                Divider()
                                    .padding(.top,10)
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.black)
                                            .frame(width: 45, height: 45)
                                        Image.appImage.linkimage
                                    }
                                    .padding(.leading,10)
                                    Text("Account linked to jay’s Coffee.")
                                        .font(.system(size: 17))
                                        .hLeading()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 65)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(50)
                                .padding(.top,15)
                                Text("Full name")
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color.gray)
                                    .padding(.top, 20)
                                    .hLeading()
                                
                                HStack {
                                    Image.appImage.profile
                                        .padding(.leading, 10)
                                    TextField("", text: $viewmodel.fullname)
                                        .font(.system(size: 19))
                                        .padding(.horizontal, 5)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(13)
                                
                                // Email Field
                                Text("Email Address")
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color.gray)
                                    .padding(.top, 20)
                                    .hLeading()
                                
                                HStack {
                                    Image.appImage.email
                                        .padding(.leading, 10)
                                    
                                    TextField("", text: $viewmodel.emailaddress)
                                        .font(.system(size: 19))
                                        .padding(.horizontal, 5)
                                        .autocapitalization(.none)
                                        .disableAutocorrection(true)
                             
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(13)
                                
                                Text("Date Joined")
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color.gray)
                                    .padding(.top, 20)
                                    .hLeading()
                                
                                HStack {
                                    Image.appImage.calendar1
                                    
                                        .padding(.leading, 10)
                                    
                                    TextField("", text: $viewmodel.datejoinded)
                                        .font(.system(size: 19))
                                        .padding(.horizontal, 5)
                                        .autocapitalization(.none)
                                        .disableAutocorrection(true)
                             
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 58)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(13)
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 60, height: 60)
                                        Image.appImage.passwordlock
                                        
                                    }
                                    VStack (alignment: .leading) {
                                        Text("Change Password")
                                            .font(.system(size: 20))
                                        Text("Change your passwords")
                                            .font(.system(size: 17))
                                            .foregroundStyle(Color.gray)
                                    }
                                    .padding(.leading,10)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: 6, height: 10)
                                        
                                }
                                .padding(.top,25)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewmodel.showPasswordSheet = true
                                }
                                
                                PrimaryButtonView(
                                    action: {
                                      
                                    },
                                    title: "Save", isEnabled: true
                                )
                                .padding(.top, 30)
                            }
                            .padding(.top, 65)
                            
                        }
        }
        .padding()
        .ignoresSafeArea()
        .navigationTitle("Personal Information")
        .font(.system(size: 24))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $viewmodel.showPasswordSheet) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Change password")
                        .font(.system(size: 20))
                    Button(action: {
                        viewmodel.showPasswordSheet = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(width: 35, height: 35)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                    .hTrailing()
                }
                .padding(.top,30)
                Divider()
               
                HStack {
                    Image.appImage.lock
                        .padding(.leading,14)
                    if viewmodel.isCurrentPasswordVisible {
                        TextField("Current Password", text: $viewmodel.currentpassword)
                                       .autocapitalization(.none)
                                       .textContentType(.password)
                                       
                               } else {
                                   SecureField("Current Password", text: $viewmodel.currentpassword)
                                       .textContentType(.password)
                               }
                    Button(action: {
                        viewmodel.isCurrentPasswordVisible.toggle()
                    }) {
                        (viewmodel.isCurrentPasswordVisible ? Image.appImage.grayeye : Image.appImage.grayeyeslash)
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.trailing,15)
              

                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                .padding(.top, 10)
                HStack {
                    Image.appImage.lock
                        .padding(.leading,14)
                    if viewmodel.isNewPasswordVisible {
                        TextField("Confirm Password", text: $viewmodel.confirmnewpassword)
                                       .autocapitalization(.none)
                                       .textContentType(.password)
                               } else {
                                   SecureField("Confirm Password", text: $viewmodel.confirmnewpassword)
                                       .textContentType(.password)
                               }
                    Button(action: {
                        viewmodel.isNewPasswordVisible.toggle()
                    }) {
                        (viewmodel.isNewPasswordVisible ? Image.appImage.grayeye : Image.appImage.grayeyeslash)
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.trailing,15)
              

                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                .padding(.top, 10)
                PrimaryButtonView(
                    action: {
                        
                        viewmodel.passwordchangedsheet = true
                    },
                    title: "Save",
                    isEnabled: !viewmodel.currentpassword.isEmpty && !viewmodel.confirmnewpassword.isEmpty
                )
                .padding(.top, 30)
                Spacer()
                    .sheet(isPresented: $viewmodel.passwordchangedsheet) {
                        VStack(alignment: .leading,spacing: 20) {
                            HStack(alignment: .top) {
                                Image.appImage.congratssheetimage
                                    .hLeading()
                                    .padding(.leading,5)
                                Spacer()
                            }
                            Text("Password changed!")
                                .font(.system(size: 28))
                                .hLeading()
                                
                                .padding(.top,10)
                            Text("Your password has been changed.")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.gray)
                            VStack(spacing: 16) {
                                PrimaryButtonView(action: {
                                    viewmodel.passwordchangedsheet = false
                                    viewmodel.showPasswordSheet = false
                                }, title: "Done", isEnabled: true)

                            }
                         
                        }
                        .padding()
                        .presentationDetents([.height(460)])
                    }
            }
            .padding()
            .presentationDetents([.height(390)])
        }
    }
}

#Preview {
    PersonalInformation()
}
