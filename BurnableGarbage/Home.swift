//
//  Home.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/28.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                LottieView(name: "garbageCharacter")
                    .frame(width:geometry.size.width, height: geometry.size.height)
                    .background(Color.cyan)
                
                VStack {
                    HStack{
                        Color.clear
                            .frame(height: geometry.size.height * 0.05)
                        Button {
                            if let url = URL(string: "https://gomiwake.hp.peraichi.com/?_ga=2.161126525.1571875470.1665143275-933510267.1665143275&_gac=1.56031705.1665143275.Cj0KCQjwnP-ZBhDiARIsAH3FSRf_fPiCcbsU_NcisWjIDoZKKph3_NPjcjBEYu6ncSfntGl4NoOidyoaAge4EALw_wcB") {
                                            UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
                                                print(completed)
                                            })
                                        }
                        } label: {
                            Image(systemName: "doc.text.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width:  geometry.size.height * 0.06, height: geometry.size.height * 0.06)
                                .padding()
                        }
                    }
//                    Image(systemName: "gearshape.fill")
                        .frame(height: geometry.size.height * 0.05)
                    Text("ゴミをわけよう")
                        .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.1 : geometry.size.height * 0.1))
                        .lineLimit(1)
                        .foregroundColor(.white)
                        
                    Spacer()
                }
            }
        }
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
