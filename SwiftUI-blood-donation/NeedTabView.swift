//
//  NeedTabView.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/15.
//

import SwiftUI
import FirebaseFirestore

struct NeedTabView: View {
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var id = ""
    @State private var reason = ""
    @State private var blood_type = ""
    
    @State private var  showingAlert = false
    @State private var showingFailureAlert = false

    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("헌혈증이 필요해요")
                    .font(.system(size: 35, weight: .heavy, design: .serif))
                    .padding([.trailing])
                Button(action: {
                    if name == "" || phone == "" || email == "" || id == "" || reason == "" || blood_type == "" {
                        showingFailureAlert = true
                    } else {
                    let db = Firestore.firestore()
                    db.collection("Data").document().setData(["type":"Need","name":name,"phone":phone,"email":email,"id":id,"reason":reason, "blood_type":blood_type])
                    showingAlert = true

                    name = ""
                    phone = ""
                    email = ""
                    id = ""
                    reason = ""
                    blood_type = ""
                        
                    }
                }) {
                    Text("제출")
                        .foregroundColor(.black)
                        .font(.system(size:20, weight: .bold, design: .serif))
                }
                .alert(isPresented: $showingFailureAlert) {
                    Alert(title: Text("모든 항목을 작성해주세요"), message: nil, dismissButton: .default(Text("확인")))
                }
            }
                        
            Form {
                Section {
                    Text("이름")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("이름", text: $name)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Section {
                    Text("휴대폰 번호")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("휴대폰 번호", text: $phone)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Section {
                    Text("이메일")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("이메일", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Section {
                    Text("카카오톡 아이디")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("카카오톡 아이디", text: $id)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Section {
                    Text("혈액형")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("혈액형", text: $blood_type)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Section {
                    Text("이유")
                        .font(.system(size: 15, weight: .bold, design: .serif))
                    TextField("이유", text: $reason)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("제출 완료!"), message: nil, dismissButton: .default(Text("확인")))
            }
        }
    }
}

struct NeedTabView_Previews: PreviewProvider {
    static var previews: some View {
        NeedTabView()
    }
}
