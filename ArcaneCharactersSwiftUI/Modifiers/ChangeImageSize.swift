//
//  ChangeImageSize.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 01.12.2024.
//

import SwiftUI

struct ChangeImageSize: ViewModifier {
    let height: Double

    func body(content: Content) -> some View {
        let heightCGFloat = CGFloat(height)
        content
            .frame(width: heightCGFloat, height: heightCGFloat)
            .cornerRadius(heightCGFloat/8)
    }
}

extension View {
    func changeImageSize(_ height: Double) -> some View {
        modifier(ChangeImageSize(height: height))
    }
}
