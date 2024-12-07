//
//  Post.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: URL?
    
    init(id: Int, title: String, description: String, image: URL?) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
    }
    
    init(character: CharacterResponse) {
        self.id = character.id
        self.title = character.name
        self.description = character.url
        self.image = URL(string: character.image?.original ?? "")
    }
    
    init() {
        self.id = 1
        self.title = "Jayce"
        self.description = ""
        self.image = URL(string: "https://static.tvmaze.com/uploads/images/medium_portrait/545/1364527.jpg")
    }
}
