//
//  ContentView.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/14.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var defaults = UserDefaults.standard
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
                self?.defaults.set(true, forKey: "signedIn")
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
                self?.defaults.set(true, forKey: "signedIn")
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
        self.defaults.set(false, forKey: "signedIn")
    }
}

struct LoginView: View {
            
    @EnvironmentObject var viewModel: AppViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Text("로그인되었습니다.")
                        .padding()
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Text("돌아가기")
                        }
                        Button {
                            viewModel.signOut()
                            
                        } label: {
                            Text("로그아웃")
                        }

                    }

                }

            } else {
                SignInView()
            }
        }
            .onAppear {
                viewModel.signedIn = viewModel.isSignedIn
            }

    }
}

struct SignInView: View {
        
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack(alignment: .center) {
                Image("donation")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                
                VStack(alignment: .trailing) {
                    HStack() {
                        Text("아이디")
                        TextField("아이디를 입력하세요", text: $email)
                            .frame(width: 200)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    
                    HStack() {
                        Text("비밀번호")
                        SecureField("비밀번호를 입력하세요", text: $password)
                            .frame(width: 200)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                }
                .padding()
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                }) {
                    Text("로그인")
                }
                .padding()
                
                NavigationLink("회원가입", destination: SignUpView())
            }
    }
}

struct SignUpView: View {
        
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack(alignment: .center) {
                Image("donation")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                
                VStack(alignment: .trailing) {
                    HStack() {
                        Text("아이디")
                        TextField("아이디를 입력하세요", text: $email)
                            .frame(width: 200)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    
                    
                    HStack() {
                        Text("비밀번호")
                        SecureField("비밀번호를 입력하세요", text: $password)
                            .frame(width: 200)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                }
                .padding()
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                    
                }) {
                    Text("계정 생성")
                }
                .padding()
                
            }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
