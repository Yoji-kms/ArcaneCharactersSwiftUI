//
//  InfoView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoView: View {
    var characters: [Character]
    var rowHeight: Double
    var titleOn: Bool
    let networkService = NetworkService()
    
    var body: some View {
        NavigationView {
            List(characters) { character in
                NavigationLink {
                    InfoDetails(character: character)
                } label: {
                    InfoRow(character: character, rowHeight: rowHeight)
                }
            }
            .optionalNavigationTitle(isOn: titleOn, title: "Arcane Characters")
            .listStyle(.plain)
        }
    }
}
