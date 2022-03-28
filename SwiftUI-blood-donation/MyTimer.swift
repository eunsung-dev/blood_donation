//
//  MyTimer.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/15.
//

//MyTimer View
 
import Foundation
import SwiftUI
import Combine
 
class MyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
                                              //간격        //반복되기때문에 true   //timer을 in 해준다.
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            self.value += 1
            if self.value > 2 {
                self.value = 0
            }
        }
    }
}
