//
//  InfoDetails.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoDetails: View {
    var character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                Text(character.title)
                    .font(.largeTitle)
                AsyncImage(url: character.image) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person.crop.square")
                }
                    .scaledToFill()
                    .clipShape(Rectangle())
                    .cornerRadius(16)
                    .padding([.all], 16)
                HStack {
                    if let url = URL(string: character.description) {
                        Link("Info about \(character.title) here", destination: url)
                            .font(.title2)
                            .padding([.leading, .trailing], 16)
                            .environment(\.openURL, OpenURLAction(handler: handleUrl))
                    } else {
                        Text("There is no info about \(character.title) yet 😢")
                            .font(.title2)
                            .padding([.leading, .trailing], 16)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func handleUrl(_ url: URL) -> OpenURLAction.Result {
        return .systemAction
    }
}
