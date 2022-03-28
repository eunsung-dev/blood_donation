//
//  ManagementView.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                HomeTabView()
                    .tabItem {
                        Image("home")
                            .renderingMode(.template)
                        Text("홈")
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle("")
                    .tag(0)
                
                DonationTabView()
                    .tabItem {
                        Image("heart")
                            .renderingMode(.template)
                        Text("기부해요")
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle("")
                    .tag(1)

                NeedTabView()
                    .tabItem {
                        Image("customer")
                            .renderingMode(.template)
                        Text("필요해요")
                    }
                    .tag(2)
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
