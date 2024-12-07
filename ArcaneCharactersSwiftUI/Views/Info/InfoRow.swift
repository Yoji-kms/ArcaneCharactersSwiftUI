//
//  InfoRow.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoRow: View {
    var character: Character
    var rowHeight: Double
    
    var body: some View {
        HStack {
            AsyncImage(url: character.image) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.crop.square")
            }
                .scaledToFill()
                .clipShape(Rectangle())
                .changeImageSize(self.rowHeight)
                .padding(.leading, 16)
            
            Text(character.title)
            Spacer()
        }
        .changeRowHeight(rowHeight)
    }
}

#Preview {
    @Previewable var character = Character(
        id: 1,
        title: "Jayce",
        description: "",
        image: URL(string: "https://static.tvmaze.com/uploads/images/medium_portrait/545/1364527.jpg"
                  )
    )
    @Previewable var rowHeight: Double = 50
    
    InfoRow(character: character, rowHeight: rowHeight)
}
