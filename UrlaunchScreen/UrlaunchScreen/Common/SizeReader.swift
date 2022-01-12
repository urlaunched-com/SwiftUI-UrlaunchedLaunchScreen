//
//  SizeReader.swift
//  UrlaunchScreen
//
//  Created by  Vladyslav Fil on 29.12.2021.
//

import SwiftUI

//MARK: - Getting the size of a view
extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
            .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    func readRect(coordinateSpace: String, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: RectPreferenceKey.self, value: geometryProxy.frame(in: .named(coordinateSpace)))
            }
        )
        .onPreferenceChange(RectPreferenceKey.self, perform: onChange)
    }
}

private struct RectPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}

extension View {
    func readOffset(coordinateSpace: String, onChange: @escaping (CGFloat) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: OffsetPreferenceKey.self, value: geometryProxy.frame(in: .named(coordinateSpace)).minY)
            }
        )
        .onPreferenceChange(OffsetPreferenceKey.self, perform: onChange)
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

