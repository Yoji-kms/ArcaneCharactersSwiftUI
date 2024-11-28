//
//  TabBarView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 28.11.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "list.clipboard")
                }
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "globe")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    TabBarView()
}
