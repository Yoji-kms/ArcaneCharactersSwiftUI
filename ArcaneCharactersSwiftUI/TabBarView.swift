//
//  TabBarView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 28.11.2024.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("titleOn") private var titleOn: Bool = true
    @AppStorage("postRowHeight") private var postRowHeight: Double = 50
    
    var body: some View {
        TabView {
            InfoView(
                rowHeight: postRowHeight,
                titleOn: titleOn
            )
                .tabItem {
                    Label("Info", systemImage: "list.clipboard")
                }
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "globe")
                }
            SettingsView(
                titleOn: $titleOn,
                postRowHeight: $postRowHeight
            )
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    TabBarView()
}
