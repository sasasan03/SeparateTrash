//
//  MiddleView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/19.
//

import SwiftUI
import AVFoundation

struct TouchView: View {
    
    @State private var plastic = true
    @State private var kamikuzu = true
    @State private var nuigurumi = true
    @State private var shoes = true
    @State private var notebook = true
    @State private var kutsushita = true
    @State private var dummy = true
    
    @State var counter:Int = 0
    
    @Binding var ButtonGarbageOn: Bool
    @Binding var HomeOn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            
            if !plastic && !kamikuzu && !nuigurumi && !notebook && !shoes && !kutsushita {
                
                        CongratulationsView()
                
                    }
   
            VStack {
                
                HStack{
                    
                    Button(action: {
                        ButtonGarbageOn = false
                        HomeOn = true
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width:  geometry.size.height * 0.05, height: geometry.size.height * 0.05)
                        //                            .fontWeight(.black)
                        //                            .lineLimit(1)
                        //                            .minimumScaleFactor(1.0)
                    }
                    Spacer()
                    
                    Button {
                        plastic = true
                        kamikuzu = true
                        nuigurumi = true
                        shoes = true
                        notebook = true
                        kutsushita = true
                    } label: {
                        Image(systemName: "exclamationmark.arrow.triangle.2.circlepath")
                            .resizable()
                            .scaledToFit()
                            .frame(width:  geometry.size.height * 0.06, height: geometry.size.height * 0.06)
                            .foregroundColor(Color.red)
//                            .padding()
                        //                            .fontWeight(.black)
                        //                            .lineLimit(1)
                        //                            .minimumScaleFactor(1.0)
                    }
                    
                }
                
                //                Spacer()
                if plastic || kamikuzu || nuigurumi || notebook || shoes || kutsushita {
                    Text("プラスチックごみはどれ？？")
                        .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.07 : geometry.size.height * 0.02))
                        .lineLimit(1)

                }
                //                Spacer()
                
                HStack {
                    
                    Button {
                        guard shoes else {
                            return
                        }
                        withAnimation() {
                            //                            self.plastic.toggle()
                            shoes = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                //                                if plastic == false{
                                playSoundWrong()
                            }
                        }
                    } label: {
                        if shoes {
                            Image("shoes")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: geometry.size.width / 2, y: geometry.size.height))
                        } else {

                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    
                    Button {
                        guard nuigurumi else {
                            return
                        }
                        withAnimation() {
                            nuigurumi = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                
                                playSoundWrong()
                                
                            }
                        }
                    } label: {
                        if nuigurumi {
                            Image("nuigurumi")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: geometry.size.width / 25, y: geometry.size.height))
                        } else {
                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    Button {
                        guard notebook else {
                            return
                        }
                        withAnimation() {
                            notebook = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                playSoundWrong()
                            }
                        }
                    } label: {
                        if notebook {
                            Image("notebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: -geometry.size.width / 2, y:  geometry.size.height))
                        } else {
                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    
                }
                HStack {
                    
                    Button {
                        guard kutsushita else {
                            return
                        }
                        withAnimation() {
                            kutsushita = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                playSoundWrong()
                            }
                        }
                    } label: {
                        if kutsushita {
                            Image("kutsushita")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: geometry.size.width, y: geometry.size.height))
                        } else {
                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    Button {
                        guard plastic else {
                            return
                        }
                        withAnimation() {
                            plastic = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                playSoundCorrect()
                            }
                        }
                    } label: {
                        if plastic {
                            Image("plastic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: geometry.size.width / 25, y: geometry.size.height))
                        } else {
                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    Button {
                        guard kamikuzu else {
                            return
                        }
                        withAnimation() {
                            kamikuzu = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                playSoundWrong()
                            }
                        }
                    } label: {
                        if kamikuzu {
                            Image("kamikuzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                                .transition(AnyTransition.offset(x: -geometry.size.width , y:  geometry.size.height))
                        } else {
                            Color.clear
                                .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        }
                    }
                    
                    
                }

                //                Spacer()
                if plastic || kamikuzu || nuigurumi || notebook || shoes || kutsushita {
                    ZStack {
                        
                        Image("gomibukuro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.27, height: geometry.size.height * 0.27)
                        
                        
                        if shoes == false {
                            WrongView()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                               
                                .animation(
                                    .default.delay(0.2))
                        }
                        
                        if nuigurumi == false {
                            WrongView()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                               
                                .animation(
                                    .default.delay(0.2))
                        }
                        
                        if notebook == false{
                            WrongView()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                
                                .animation(
                                    .default.delay(0.5))
                        }
                        
                        if kutsushita == false{
                            WrongView()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
//                                .scaleEffect(kutsushita ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                        }
                        
                        if plastic == false{
                            SplashSuccessScreen()
//                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                                .animation(
                                    .default.delay(0.2))
                        }
                        
                        if kamikuzu == false{
                            WrongView()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
//                                .scaleEffect(kamikuzu ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                        }
                    }
                }
            }
        
        }
    }
}
        

struct TouchView_Previews: PreviewProvider {
    static var previews: some View {
        TouchView(ButtonGarbageOn: .constant(false), HomeOn: .constant(false))
    }
}
