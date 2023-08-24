//
//  Test.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/10/04.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        GeometryReader { geometry in
                
                ZStack{
                    Color.green
                        .ignoresSafeArea(.all)
                    
                    LottieView(name: "goodJob")
                        .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7)
                    LottieView(name: "cracker")
                        .frame(width: geometry.size.width * 1.0, height: geometry.size.height * 1.0)
                    VStack {
                        Text("よくがんばりました👏🎉")
                            .offset(y: geometry.size.height * 0.3)
                            .frame(height: geometry.size.height)
                            .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.08 : geometry.size.height * 0.08))
                            .lineLimit(1)
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
