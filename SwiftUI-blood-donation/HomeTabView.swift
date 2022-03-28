//
//  HomeTabView.swift
//  SwiftUI-blood-donation
//
//  Created by 최은성 on 2022/03/14.
//

import SwiftUI

struct HomeTabView: View {
    
        
        @ObservedObject var myTimer = MyTimer()
    
        @State private var showModal = false
    
        @ObservedObject private var viewModel = DataViewModel()
        var body: some View {
                    
        VStack {
            HStack {
                Button(action: {
                }) {
                    Image("hamburger")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }
                Spacer()
                Image("donation")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Button(action: {
                    showModal = true
                }) {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .sheet(isPresented: self.$showModal) {
                    LoginView()
                }
            }
            .frame(height: 30)
            .padding()
            
            ZStack {
                TabView() {
                    Image("banner_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(0)
                    
                    Image("banner_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(1)

                    Image("banner_3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(2)
                }
                .aspectRatio(contentMode: .fit)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
            ZStack {
                List(viewModel.informations, id: \.id) { information in
                    Text("\(information.type)) \(information.name), \(information.blood_type)")
                }
                .onAppear() {
                    self.viewModel.fetchData()
                }
            }

        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
