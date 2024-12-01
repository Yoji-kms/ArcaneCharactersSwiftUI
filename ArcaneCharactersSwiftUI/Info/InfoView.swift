//
//  InfoView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoView: View {
    @State private var posts = [Post]()
    var rowHeight: Double
    var titleOn: Bool
    let networkService = NetworkService()
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink {
                    InfoDetails(post: post)
                } label: {
                    InfoRow(post: post, rowHeight: rowHeight)
                }
            }
            .optionalNavigationTitle(isOn: titleOn, title: "Arcane Characters")
            .listStyle(.plain)
        }
        .task {
            let url = self.networkService.getUrl()
            let netPosts: Response? = await url.handleAsDecodable()
            if let netPosts {
                self.posts = netPosts._embedded.cast.map { castItem in
                    Post(character: castItem.character)
                }
            } else {
                posts = []
            }
        }
    }
}

#Preview {
    @Previewable var rowHeight: Double = 50
    
    InfoView(rowHeight: rowHeight, titleOn: true)
}
