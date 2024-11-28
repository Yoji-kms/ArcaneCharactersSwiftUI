//
//  InfoRow.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoRow: View {
    var post: Post
    
    var body: some View {
        HStack {
            AsyncImage(url: post.image) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.crop.square")
            }
                .scaledToFill()
                .clipShape(Rectangle())
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .padding(.leading, 16)
            
            Text(post.title)
            Spacer()
        }
    }
}
