
//
//  TextButton.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import SwiftUI

struct TextButton: View {
    let text: String
    var action: () -> Void
    var fullWidth: Bool = true
    var controlSize: ControlSize = .regular
    var disabled: Bool = false
    var cornerRadius: CGFloat = 16
    var padding: CGFloat = 8

    var body: some View {
        Button(action: action) {
            Text(text)
                .padding(padding)
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .fontWeight(.semibold)
        }
        .buttonStyle(.borderless)
        .controlSize(controlSize)
        .disabled(disabled)
        .cornerRadius(cornerRadius, antialiased: true)
    }
}

struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            TextButton(text: "Text button", action: {})
            TextButton(text: "Disabled", action: {}, disabled: true)
            TextButton(text: "Non full-width", action: {}, fullWidth: false)
        }
        .padding(10)
    }
}
