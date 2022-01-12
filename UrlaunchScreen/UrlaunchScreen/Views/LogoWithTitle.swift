//
//  LogoWithTitle.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 29.12.2021.
//

import SwiftUI

struct LogoWithTitle: View {
    var show: Bool
    var logoColor: Color = .urlYellow
    var titleColor: Color = .white
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: spacing) {
                Image.logo
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: logoWidth)
                    .foregroundColor(logoColor)
                
                Image.name
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: titleWidth)
                    .foregroundColor(titleColor)
            }
            .offset(x: show ? 0 : -size.width)
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .readSize { size = $0 }
    }
    
    var spacing: CGFloat { size.width * 0.09 }
    var logoWidth: CGFloat { size.width * 0.22 }
    var titleWidth: CGFloat { size.width * 0.66 }
}

struct LogoWithTitle_Previews: PreviewProvider {
    static var previews: some View {
        LogoWithTitle(show: true)
            .padding(.horizontal, 70)
            .preferredColorScheme(.dark)
    }
}
