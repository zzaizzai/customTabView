//
//  HomeView.swift
//  customTabView
//
//  Created by 小暮準才 on 2022/08/30.
//

import SwiftUI


struct MainTabView: View {
    
    @EnvironmentObject var value : ValuesModel
    
    @State var showNextPage = false
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var countForScroll = 0
    @State var currentTab = "house"
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab){
                HouseView(countForScroll: $countForScroll, showNextPage: $showNextPage)
                    .tag("house")
                Text("message")
                    .tag("message")
                Text("person")
                    .tag("person")
                Text("mail")
                    .tag("mail")
                
            }
            .padding(.bottom)
        }
        .safeAreaInset(edge: .bottom) {
            customtabview
        }
    }
    
    private var customtabview : some View {
        HStack(spacing: 0) {
            TabVButton(image: "house")
            TabVButton(image: "message")
            TabVButton(image: "person")
            TabVButton(image: "mail")
        }
        .background(Color.white)
        
    }
    
    @ViewBuilder
    func TabVButton(image: String) -> some View {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? .red : .gray )
                .frame(maxWidth: .infinity)

                .onTapGesture {
                    
                    if currentTab == image {
                        if self.showNextPage {
                            self.showNextPage = false
                        } else {
                            self.countForScroll += 1
                        }
                    } else {
                            currentTab = image
                        
                    }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ValuesModel())
            
    }
}
