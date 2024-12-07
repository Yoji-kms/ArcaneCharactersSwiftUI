//
//  Response.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import Foundation

struct CastEmbedResponse: Decodable {
    let _embedded: CastResponse
}

struct CastResponse: Decodable {
    let cast: [CastItemResponse]
}

struct CastItemResponse: Decodable {
    let character: CharacterResponse
}

struct CharacterResponse: Decodable {
    let id: Int
    let name: String
    let url: String
    let image: CastImageResponse?
}
