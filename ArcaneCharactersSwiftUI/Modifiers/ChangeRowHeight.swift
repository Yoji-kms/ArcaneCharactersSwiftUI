//
//  ChangeRowHeight.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 01.12.2024.
//

import SwiftUI

struct ChangeRowHeight: ViewModifier {
    let height: Double

    func body(content: Content) -> some View {
        let heightCGFloat = CGFloat(height)
        content
            .frame(height: heightCGFloat)
            .font(.system(size: heightCGFloat/3))
    }
}

extension View {
    func changeRowHeight(_ height: Double) -> some View {
        modifier(ChangeRowHeight(height: height))
    }
}
