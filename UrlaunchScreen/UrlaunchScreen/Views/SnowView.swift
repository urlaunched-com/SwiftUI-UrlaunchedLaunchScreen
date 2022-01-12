//
//  SnowView.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 29.12.2021.
//

import SwiftUI

struct SnowView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let screenSize = UIScreen.main.bounds
        let screenRect = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        let view = UIView(frame: screenRect)
        view.layer.masksToBounds = true
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = screenRect
        emitterLayer.emitterShape = .line
        emitterLayer.emitterPosition = CGPoint(x: screenSize.midX, y: 0)
        
        emitterLayer.emitterMode = .surface
        emitterLayer.renderMode = .oldestLast
        emitterLayer.emitterCells = createEmitterCells()
        emitterLayer.emitterSize = .init(width: screenSize.width, height: 1)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    func createEmitterCells() -> [CAEmitterCell] {
        let cell = CAEmitterCell()
        cell.birthRate = 60
        cell.lifetime = 15
        cell.velocity = 80

        cell.scale = 0.01
        cell.scaleRange = 0.04
        
        cell.emissionRange = CGFloat.pi
        
        cell.spin = 1.5
        cell.spinRange = 1
        
        cell.contents = UIImage(named: "snowflake")?.cgImage
        
        return [cell]
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
            .edgesIgnoringSafeArea(.all)
            .preferredColorScheme(.dark)
    }
}
