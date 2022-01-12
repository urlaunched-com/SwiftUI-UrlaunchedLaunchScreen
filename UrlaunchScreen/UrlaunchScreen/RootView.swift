//
//  RootView.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 27.12.2021.
//

import SwiftUI

struct RootView: View {
    @State private var launchEndAnimation: Bool = false
    
    var body: some View {
        VStack {
            if !launchEndAnimation {
                LaunchScreen(endAnimation: $launchEndAnimation)
            } else {
                VStack {
                    Text("Happy New Year!")
                    Text("2022")
                }
                .foregroundColor(.urlYellow)
                .font(.system(size: 32, weight: .bold, design: .serif))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                )
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.urlYellow)
                        Spacer()
                        Spacer()
                        Image(systemName: "hand.thumbsdown")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(height: 70)
                        .background(Color.urlBlack.opacity(0.8).edgesIgnoringSafeArea(.bottom))
                    , alignment: .bottom
                )
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
