//
//  HomeView.swift
//  customTabView
//
//  Created by 小暮準才 on 2022/08/30.
//

import SwiftUI


struct HouseView: View {
    
    @EnvironmentObject var value : ValuesModel
    @Binding var countForScroll : Int
    
    @Binding var showNextPage : Bool
    

    var body: some View {
        NavigationView{
            ScrollView {
                ScrollViewReader{ ScrollViewProxy in
                    VStack{
                        
                        HStack{Spacer()}
                            .id("Empty")
                        
                        NavigationLink("", isActive: $showNextPage) {
                            NextView()
                        }
                        
                        
                        ForEach(0 ..< 20 ) { item in
                            HStack{
                                Spacer()
                                Text("\(item)")
                                Spacer()
                            }
                            .padding()
                            .background(Color.init(white: 0.9))
                            .cornerRadius(20)
                        }
                        
                        Button {
                            self.showNextPage.toggle()
                        } label: {
                            Text("show next page")
                        }
                    }
                    .onReceive(value.$count) { XX in
                        withAnimation {
                            ScrollViewProxy.scrollTo("Empty", anchor: .top)
                        }
                    }
                    .onChange(of: countForScroll) { newValue in
                        value.count += 1
                    }
                }

            }
//            .safeAreaInset(edge: .top, content: {
//                HStack{
//                    Text("\(self.countForScroll)")
//                    Text("page: \(value.count)")
//                }
//            })
            .navigationBarHidden(true)
        }
        
    }
}

//struct HouseView_Previews: PreviewProvider {
//    static var previews: some View {
//        HouseView(show: false)
//    }
//}
