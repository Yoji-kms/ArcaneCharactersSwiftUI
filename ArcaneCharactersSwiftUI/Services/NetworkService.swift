//
//  NetworkService.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import Foundation

final class NetworkService {
    func getUrl() -> String {
        URLCache.shared.diskCapacity = 40_000_000
        return "https://api.tvmaze.com/singlesearch/shows?q=arcane&embed=cast"
    }
}
