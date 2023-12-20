//
//  ContentView.swift
//  NC2_teme5
//
//  Created by Ahlam ALshehri on 07/06/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @State var place: Place?
    
    let places: [Place] = [
        Place(name: "آفضل كعكة على الإطلاق", image: "barcelona"),
        Place(name: "الأرنب الذي ذهب للمدينة", image: "paris"),
        Place(name: "آطول آذين بالعالم ", image: "nyc"),
]
    
    var body: some View {
        ZStack{
            Image("aaa")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                Text(place?.name ?? "")
                    .font(
                        Font.custom("SF Arabic Rounded", size: 40)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0, green: 0.22, blue: 0.29).opacity(0.74)
                    )
                    .frame(width: 360, height: 93, alignment: .top)
                    .padding(.leading, 190)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(places) { place in
                            Image(place.image)
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 500, height: 500)
                                .shadow(radius: 10, y: 10)
                                .scrollTransition(topLeading: .interactive,
                                                  bottomTrailing: .interactive,
                                                  axis: .horizontal) { effect, phase in
                                    effect
                                        .scaleEffect(1 - abs(phase.value))
                                        .opacity(1 - abs(phase.value))
                                }
                                                  .onTapGesture {
                                                      withAnimation {
                                                          self.place = place
                                                      }
                                                  }
                        }
                    }
                    .scrollTargetLayout()
                }
                //.frame(height: 90)
                
                .safeAreaPadding(.horizontal, 70)
                .scrollClipDisabled()
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $place)
                .onAppear {
                    place = places[2]
                }
                
                //Spacer()
            }.padding(.bottom,90)
                .padding(.trailing,90)
        }
    }
}

#Preview {
    ContentView()
}


struct Place: Hashable, Identifiable {
    var id: Self { self }

    let name: String
    let image: String
}
