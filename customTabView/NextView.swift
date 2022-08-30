//
//  NextView.swift
//  customTabView
//
//  Created by 小暮準才 on 2022/08/30.
//

import SwiftUI

struct NextView: View {
    @State var nextPage2 = false
    var body: some View {
        VStack{
            NavigationLink("", isActive: $nextPage2) {
                Text("nextpage2")
                
            }
            
            Button {
                self.nextPage2.toggle()
            } label: {
                Text("nextpage2")
            }

        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
