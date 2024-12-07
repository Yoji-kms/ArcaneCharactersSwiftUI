//
//  TextWithLeftAlignment.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 01.12.2024.
//

import SwiftUI

struct TextWithLeftAlignment: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    @Previewable var text = ""
    TextWithLeftAlignment(text: text)
}
