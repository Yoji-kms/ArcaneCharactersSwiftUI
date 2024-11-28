//
//  NetUtils.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//


import Foundation

extension String {
    func handleAsDecodable <T: Decodable>() async -> T? {
        do {
            guard let url = URL(string: self) else {
                return nil
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            print("♦️\(error)")
            return nil
        }
    }
}
