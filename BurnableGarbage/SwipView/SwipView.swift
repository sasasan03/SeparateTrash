//
//  SwipGarbageVar2.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/18.
//

import SwiftUI

//struct Pictures: Identifiable {
//    var id: ObjectIdentifier
//    var items : String
//    var correctOrWrong : String
//}

struct SwipView: View {
        
        @Binding var SwipViewOn: Bool
        @Binding var HomeOn: Bool
        @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
        @State var itemkind = ["M","M","P","M","M"]
        
//        @State var transration = CGPoint.zero
        @State var offset: CGSize = CGSize(width: 0, height: 0)
        @State var bangou: Int = 4
        
        @State var batsuFlag:Bool = false
        @State var seikaiFlag:Bool = false
        
        var body: some View {
            GeometryReader { geometry in
                
                let dragGesture = DragGesture()
                   
                        .onChanged { value in
                            offset = value.translation
                            
                        }
                        .onEnded{ _ in
                            guard bangou >= 0 && bangou <= 4 else {
                                return
                            }
                            if  offset.height >  0  && itemkind[bangou] == "P" ||
                                    offset.height < 0  && itemkind[bangou] == "M"{
                                playSoundCorrect()
                                seikaiFlag = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    seikaiFlag = false
                                    bangou -= 1
                                    offset = CGSize(width: 0,height: 0)
                                }
                            }else {
                                playSoundWrong()
                                batsuFlag = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    batsuFlag = false
                                    bangou -= 1
                                    offset = CGSize(width: 0,height: 0)
                                }
                            }
                            if bangou > 0 {
                                
                            } else{
                                print("終わり")
                            }
                        }
                
                //guard文効果なし
                ZStack {
                    BackView()
//offset(width0,heigth0)は本来左上に来るはず。positionにgeometryを使ったことで、positionの初期位置が真ん中にずれた？
                    if bangou >= 0 && bangou <= 4 {
                        Image(items[bangou])
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                            .position(x: geometry.size.width / 2 + offset.width, y: geometry.size.height / 2 + offset.height)
                            .gesture(dragGesture)
                    } else if bangou <= -1 {

                        ZStack {
                            CongratulationsView()
                        }
                    }
                    
                    VStack{
                            HStack(spacing: 0){

                                Button() {
                                    self.SwipViewOn = false
                                    self.HomeOn = true
                                } label: {
                                    //戻る
                                    Image(systemName: "chevron.backward")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:  geometry.size.height * 0.06, height: geometry.size.height * 0.06)
                                        .foregroundColor(Color.blue)

                                Spacer()
                        }
                            }
                        Spacer()
                        }
                    //代入する。？言葉の意味 splashfag にfalseを代入
                    if batsuFlag {
                        Image("batsu")
                            .resizable()
                            .scaledToFit()
                            .frame(width:  geometry.size.height * 0.5, height: geometry.size.height * 0.5)
                    }
                    if seikaiFlag {
                        Image("maru")
                            .resizable()
                            .scaledToFit()
                            .frame(width:  geometry.size.height * 0.5, height: geometry.size.height * 0.5)
                    }
                    
                }
            }
        }
}

struct SwipView_Previews: PreviewProvider {
    static var previews: some View {
        SwipView(SwipViewOn: .constant(false), HomeOn: .constant(false))
    }
}
