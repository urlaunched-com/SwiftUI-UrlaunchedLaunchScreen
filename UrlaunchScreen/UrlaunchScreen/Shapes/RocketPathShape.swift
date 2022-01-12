//
//  RocketPathShape.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 27.12.2021.
//

import SwiftUI

struct RocketPathShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius: CGFloat = rect.width / 2
        let topShift: CGFloat = 20
        let bottomShift: CGFloat = 2
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let bottomCenterPoint = CGPoint(x: rect.midX, y: rect.maxY)

        path.addRelativeArc(
            center: centerPoint,
            radius: radius + topShift,
            startAngle: .degrees(-63),
            delta: .degrees(5.6)
        )
        
        path.addQuadCurve(
            to: bottomCenterPoint,
            control: .init(x: rect.midX * 1.58, y: rect.midY * 1.4)
        )
        
        path.addRelativeArc(
            center: centerPoint,
            radius: radius + bottomShift,
            startAngle: .degrees(90),
            delta: .degrees(39.47)
        )
        
        path.addQuadCurve(
            to: .init(x: rect.midX * 1.52, y: rect.midY * 0.10),
            control: .init(x: rect.midX * 1.24, y: rect.midY * 1.2)
        )
        
        return path
    }
}

struct RocketPathShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    Circle()
                        .fill(Color.urlYellow)
                    
                    RocketPathShape()
                        .fill(Color.urlBlack)
                    
                    Circle()
                        .fill(Color.urlYellow)
                        .frame(
                            width: geo.size.width * 0.13,
                            height: geo.size.height * 0.13)
                        .offset(
                            x: geo.frame(in: .local).midX + geo.frame(in: .local).midX * 0.46,
                            y: geo.frame(in: .local).minY - geo.frame(in: .local).midY * 0.25)
                }
            }
            .frame(width: 200, height: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.urlBlack)
    }
}
