 //  CallingView.swift
//  ScallingZooming
//  Created by Sumit on 14/09/24.

 import SwiftUI

struct CallingView: View {
    
    @State private var animationCirculeCountOne = 0.5
    @State private var isShowingCircule = false
    @State private var animationCirculeCountTwo = 0.8
    @State private var animationCirculeCountThree = 1.2
    @State private var isButtonAction = true
    
    @State var Yaxis:Int = 350
    @State private var dragOffset = CGSize.zero

  var body: some View {
     ZStack {
         Rectangle()
             .fill(.clear)
             .background(Image("BG_IMG5"))
             .overlay(content: {
                 VStack {
                     VStack(alignment: .leading, spacing:6) {
                         Text("Sumit")
                             .foregroundStyle(.white)
                             .font(.system(size: 24, weight: .bold, design: .default))
                     Text("   Calling....")
                         .foregroundStyle(.white)
                         .font(.system(size: 18, weight: .bold, design: .default))
                     }
                     .offset(y: 47)
                     Rectangle()
                         .fill(.clear)
                         .overlay(content: {
                              Button {
                                  if isButtonAction {
                                      isButtonAction.toggle()
                                      isShowingCircule = true
                                      animationCirculeCountOne += 1
                                      animationCirculeCountTwo += 1
                                      animationCirculeCountThree += 1
                                  }
                              } label: {
                                  Image("profile")
                                      .resizable()
                                      .frame(width:100,height:100)
                                      .cornerRadius(50)
                                      .shadow(color:.white,radius: 1)
                              }
                              .padding(10)
                              .clipShape(.circle)
                              .overlay(
                                 Circle()
                                    .stroke(isShowingCircule == true ? .green : .clear)
                                     .scaleEffect(animationCirculeCountOne)
                                     .opacity(2 - animationCirculeCountOne)
                                     .animation(
                                         .easeInOut(duration: 1)
                                         .repeatForever(autoreverses: false),
                                         value: animationCirculeCountOne
                                  )
                              )
                              .overlay(
                                 Circle()
                                    .stroke(isShowingCircule == true ? .green : .clear)
                                     .scaleEffect(animationCirculeCountTwo)
                                     .opacity(3 - animationCirculeCountTwo)
                                     .animation(
                                         .easeInOut(duration: 1)
                                         .repeatForever(autoreverses: false),
                                         value: animationCirculeCountTwo
                                 )
                              )
                              .overlay(
                                 Circle()
                                    .stroke(isShowingCircule == true ? .green : .clear)
                                     .scaleEffect(animationCirculeCountThree)
                                     .opacity(4 - animationCirculeCountThree)
                                     .animation(
                                         .easeInOut(duration: 1)
                                         .repeatForever(autoreverses: false),
                                         value: animationCirculeCountThree
                                )
                             )
                         })
                         .offset(y: -40)
                     Spacer()
                     HStack {
                         Rectangle()
                             .fill(.red)
                             .frame(width:72,height:72)
                             .cornerRadius(36)
                             .shadow(color:.white,radius: 1)
                             .onLongPressGesture {
                                 print("Long pressed!")
                             }
                             .overlay(content: {
                                 Image(systemName: "phone.down.circle.fill")
                                     .symbolRenderingMode(.multicolor)
                                     .font(.system(size:80))
                            })
                         Spacer()
                         Rectangle()
                             .fill(.green)
                             .frame(width:72,height:72)
                             .cornerRadius(36)
                             .shadow(color:.white,radius: 1)
                             .offset(dragOffset)
                             .gesture(
                              DragGesture()
                                 .onChanged { gesture in
                                   dragOffset = gesture.translation
                              }
                              .onEnded { gesture in
                                   dragOffset = .zero
                             }
                          )
                          .overlay(content: {
                             Image(systemName: "phone.circle.fill")
                                 .symbolRenderingMode(.multicolor)
                                 .font(.system(size:80))
                       })
                   }
                  .padding([.leading,.trailing],40)
                  .padding(.bottom,70)
              }
          })
       }
    }
 }

#Preview {
    CallingView()
}
