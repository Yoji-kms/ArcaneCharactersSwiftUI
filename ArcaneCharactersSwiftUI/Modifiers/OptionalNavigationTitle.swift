//
//  OptionalNavigationTitle.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 01.12.2024.
//

import SwiftUI

struct OptionalNavigationTitle: ViewModifier {
    let isOn: Bool
    let title: String
    
    func body(content: Content) -> some View {
        if isOn {
            content
                .navigationTitle(title)
                .font(.title3)
        } else {
            content
        }
    }
}

extension View {
    func optionalNavigationTitle(isOn: Bool, title: String) -> some View {
        modifier(OptionalNavigationTitle(isOn: isOn, title: title))
    }
}
