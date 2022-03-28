//
//  DataViewModel.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/28.
//

import Foundation
import FirebaseFirestore

class DataViewModel: ObservableObject {
    @Published var informations = [Information]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Data").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.informations = documents.map { (QueryDocumentSnapshot) -> Information in
                let data = QueryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let phone = data["phone"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let id = data["id"] as? String ?? ""
                let reason = data["reason"] as? String ?? ""
                let blood_type = data["blood_type"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                
                let information = Information(name: name, phone: phone, email: email, id: id, reason: reason, blood_type: blood_type, type: type)
                return information
            }
        }
    }
}
