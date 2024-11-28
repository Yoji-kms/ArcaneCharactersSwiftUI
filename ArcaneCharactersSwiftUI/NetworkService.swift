//
//  NetworkService.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import Foundation

final class NetworkService {
    func getUrl() -> String {
        return "https://api.tvmaze.com/singlesearch/shows?q=arcane&embed=cast"
    }
}
