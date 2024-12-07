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
    @Binding var characterRowHeight: Double
    @State private var character = Character()
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
                    TextWithLeftAlignment(text: "Change character list row height at Info list")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Row height (from 30 to 150)")
                    TextWithLeftAlignment(text: "Current row height: \(Int(self.characterRowHeight))")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Image height (from 30 to 150)")
                    TextWithLeftAlignment(text: "Current image height: \(Int(self.characterRowHeight))")
                    
                    Text("")
                    
                    TextWithLeftAlignment(text: "Text height (from 10 to 50)")
                    TextWithLeftAlignment(text: "Current row height: \(Int(self.characterRowHeight/3))")
                    Slider(
                        value: $characterRowHeight, in: 30...150
                    ) { onChange in
                        self.isChanging = onChange
                    }
                    if self.isChanging {
                        InfoRow(character: self.character, rowHeight: self.characterRowHeight)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var titleOn: Bool = true
    @Previewable @State var characterRowHeight: Double = 50
    
    SettingsView(titleOn: $titleOn, characterRowHeight: $characterRowHeight)
}
