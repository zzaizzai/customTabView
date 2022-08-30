//
//  HomeView.swift
//  customTabView
//
//  Created by 小暮準才 on 2022/08/30.
//

import SwiftUI

class HouseViewModel : ObservableObject {

    @Published var count = 0
}

struct HouseView: View {
    
    
    @ObservedObject var vm = HouseViewModel()
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
                        
                        
                        ForEach(0 ..< 100 ) { item in
                            HStack{
                                Spacer()
                                Text("\(item)")
                                Spacer()
                            }
                        }
                        
                        Button {
                            self.showNextPage.toggle()
                        } label: {
                            Text("show next page")
                        }
                    }
                    .onReceive(vm.$count) { XX in
                        withAnimation {
                            ScrollViewProxy.scrollTo("Empty", anchor: .top)
                        }
                    }
                    .onChange(of: countForScroll) { newValue in
                        vm.count += 1
                    }
                }

            }
            .navigationBarHidden(true)
        }
        
    }
}

//struct HouseView_Previews: PreviewProvider {
//    static var previews: some View {
//        HouseView(show: false)
//    }
//}
