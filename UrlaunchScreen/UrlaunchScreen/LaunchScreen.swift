//
//  LaunchScreen.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 27.12.2021.
//

import SwiftUI

struct LaunchScreen: View {
    private let coordinateSpace = "Logo"
    @State private var scaleAnimation: Bool = false
    @State private var launchAnimation: Bool = false
    @State private var spaceEnterAnimation: Bool = false
    @State private var showSnowAnimation: Bool = false
    
    @State private var showCompanyNameAnimation: Bool = false
    @State private var hidePlanetAnimation: Bool = false
    
    @Binding var endAnimation: Bool
    
    @State private var planetRect: CGRect = .zero
    
    private let impactSoft = UIImpactFeedbackGenerator(style: .soft)
    private let impactHeavy = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.urlYellow)
                .readRect(coordinateSpace: coordinateSpace) { planetRect = $0 }
                .coordinateSpace(name: coordinateSpace)
                .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.width * 0.55)
                .overlay(
                    ZStack(alignment: .topLeading) {
                        RocketPathShape()
                            .fill(Color.urlBlack)
                            
                        Circle()
                            .fill(Color.urlYellow)
                            .overlay(Circle().stroke(Color.urlBlack, lineWidth: 1))
                            .frame(width: rocketSize, height: rocketSize)
                            .scaleEffect(launchAnimation ? 1 : 3)
                            .offset(
                                x: rocketMainPosition.x,
                                y: rocketMainPosition.y
                            )
                            .rotationEffect(spaceEnterAnimation ? .degrees(-272) : .degrees(0))
                            .offset(y: spaceEnterAnimation ? 90 : 0)
                    }
                    .offset(
                        x: launchAnimation ? 0 : -planetRect.maxX / 2,
                        y: launchAnimation ? 0 : planetRect.maxY
                    )
                    .rotationEffect(launchAnimation ? .degrees(0) : .degrees(30), anchor: .center)
                )
                .scaleEffect(scaleAnimation ? 1.5 : 5)
                .opacity(hidePlanetAnimation ? 0 : 1)
            
            LogoWithTitle(show: showCompanyNameAnimation)
                .padding(.horizontal, 75)
                .offset(y: planetRect.height * 1.05)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            SnowView()
                .opacity(showSnowAnimation ? 1 : 0)
                .edgesIgnoringSafeArea(.all)
        )
        .overlay(
            Color.white
                .opacity(hidePlanetAnimation && !showCompanyNameAnimation ? 1 : 0)
                .edgesIgnoringSafeArea(.all)
        )
        .background(Color.urlBlack.edgesIgnoringSafeArea(.all))
        .onAppear(perform: launchAnimations)
    }
}

//MARK: - Launch Animations
private extension LaunchScreen {
    func launchAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            impactSoft.prepare()
            withAnimation(.linear(duration: 2.2)) {
                scaleAnimation = true
                launchAnimation = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now()+2.9) {
            impactSoft.impactOccurred()
            impactHeavy.prepare()
            withAnimation(.linear(duration: 2)) {
                showSnowAnimation = true
                spaceEnterAnimation = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now()+4.6) {
            impactHeavy.impactOccurred()
            withAnimation(.linear(duration: 0.1)) {
                hidePlanetAnimation = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now()+4.8) {
            withAnimation(.linear(duration: 0.4)) {
                showCompanyNameAnimation = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+7) {
            withAnimation(.linear(duration: 0.8)) {
                endAnimation = true
                showSnowAnimation = false
            }
        }
    }
}

//MARK: - Computed Properties
private extension LaunchScreen {
    var rocketSize: CGFloat { planetRect.size.width * 0.13 }
    
    var rocketMainPosition: CGPoint {
        .init(
            x: planetRect.midX * 1.46,
            y: -planetRect.midY * 0.25
        )
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(endAnimation: .constant(false))
    }
}
