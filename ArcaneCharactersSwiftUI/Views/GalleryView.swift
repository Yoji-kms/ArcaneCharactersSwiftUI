//
//  GalleryView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct GalleryView: View {
    var characters = [Character]()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.horizontal) {
                LazyHStack(spacing: 22) {
                    ForEach(characters, id: \.self) { character in
                        VStack(spacing: 8) {
                            ZStack {
                                AsyncImage(url: character.image) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image(systemName: "photo")
                                }
                                .scrollTransition(
                                    axis: .horizontal
                                ) { content, phase in
                                    return content
                                        .rotationEffect(.degrees(phase.value * 1.5))
                                        .offset(y: phase.isIdentity ? 0 : 8)
                                }
                            }
                            .containerRelativeFrame(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                        }
                    }
                    
                }.scrollTargetLayout()
            }
            .contentMargins(.horizontal, 44)
            .scrollTargetBehavior(.paging)
        }
    }
}
