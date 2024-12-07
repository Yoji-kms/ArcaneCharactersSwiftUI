//
//  TabBarView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 28.11.2024.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("titleOn") private var titleOn: Bool = true
    @AppStorage("characterRowHeight") private var characterRowHeight: Double = 50
    private let networkService = NetworkService()
    @State private var characters = [Character]()
    
    var body: some View {
        TabView {
            InfoView(
                characters: self.characters,
                rowHeight: characterRowHeight,
                titleOn: titleOn
            )
                .tabItem {
                    Label("Characters", systemImage: "list.clipboard")
                }
            GalleryView(
                characters: self.characters.filter { character in
                    character.image != nil
                }
            )
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
            SettingsView(
                titleOn: $titleOn,
                characterRowHeight: $characterRowHeight
            )
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .task {
            let url = self.networkService.getUrl()
            let netCharacters: CastEmbedResponse? = await url.handleAsDecodable()
            if let netCharacters {
                self.characters = netCharacters._embedded.cast.map { castItem in
                    Character(character: castItem.character)
                }
            } else {
                characters = []
            }
        }
    }
}

#Preview {
    TabBarView()
}
