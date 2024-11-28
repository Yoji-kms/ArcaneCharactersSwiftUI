//
//  SettingsView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var isOn = true
    
    var body: some View {
        Form {
            Section {
                Toggle("Switch", isOn: $isOn)
            }
            Section {
                Text("Some text")
            }
        }
    }
}

#Preview {
    SettingsView()
}
