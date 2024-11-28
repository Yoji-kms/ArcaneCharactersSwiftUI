//
//  InfoView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct InfoView: View {
    @State private var posts = [Post]()
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink {
                    InfoDetails(post: post)
                } label: {
                    InfoRow(post: post)
                }
            }
            .listStyle(.plain)
        }
        .task {
            let url = NetworkService.shared.getUrl()
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
    InfoView()
}
