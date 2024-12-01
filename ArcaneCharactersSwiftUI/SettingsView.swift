//
//  SettingsView.swift
//  ArcaneCharactersSwiftUI
//
//  Created by Yoji on 27.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var titleOn: Bool
    @Binding var postRowHeight: Double
    @State private var post = Post()
    @State private var isChanging: Bool = false
    
    var body: some View {
        Form {
            Section {
                let colorSchemeText = colorScheme == .dark ? "Dark" : "Light"
                Text("\(colorSchemeText) Theme enabled")
            }
            
            Section {
                Toggle("Enable navigation title", isOn: $titleOn)
                if titleOn {
                    Text("Navigation title enabled")
                }
            }
            Section {
                VStack {
                    TextWithLeftAlignment(text: "Change post row height at Info list")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Row height (from 30 to 150)")
                    TextWithLeftAlignment(text: "Current row height: \(Int(self.postRowHeight))")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Image height (from 30 to 150)")
                    TextWithLeftAlignment(text: "Current image height: \(Int(self.postRowHeight))")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Text height (from 10 to 50)")
                    TextWithLeftAlignment(text: "Current row height: \(Int(self.postRowHeight/3))")
                    Slider(
                        value: $postRowHeight, in: 30...150
                    ) { onChange in
                        self.isChanging = onChange
                    }
                    if self.isChanging {
                        InfoRow(post: self.post, rowHeight: self.postRowHeight)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var titleOn: Bool = true
    @Previewable @State var postRowHeight: Double = 50
    
    SettingsView(titleOn: $titleOn, postRowHeight: $postRowHeight)
}
