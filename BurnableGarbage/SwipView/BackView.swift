//
//  SwipGarbageView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/30.
//

import SwiftUI

extension Color {
    static let ligthBlue = Color(red: 0.8, green: 1.0, blue: 1.0)
    static let ligthOrange = Color(red: 1.0, green: 0.6, blue: 0.4)
}

struct BackView: View {
    
    var body: some View {
        
        GeometryReader {  geometry in
            
            VStack(spacing: 0) {
                
                ZStack {
                    Color.ligthBlue
                    VStack{
                        Color.clear
                            .frame(height: geometry.size.height * 0.05)
                        Text("もえるごみ")
//                            .frame(height: geometry.size.height / 2)
                            .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.09 : geometry.size.height * 0.09))
                            .lineLimit(1)
                    Spacer()
                            
                    }
                }
                
                ZStack {
                    Color.ligthOrange
                    VStack{
                        Spacer()
                        Text("プラスチックごみ")
                            .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.09 : geometry.size.height * 0.09))
                            .lineLimit(1)
                        Color.clear
                            .frame(height: geometry.size.height * 0.05)
                    }
                    
                        
                }
            }
        }.ignoresSafeArea(edges: .all)
        }
}

struct SwipGarbageView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
