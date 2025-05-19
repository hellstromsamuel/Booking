
//
//  SecondaryButton.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import SwiftUI

struct SecondaryButton: View {
    let text: String
    var action: () -> Void
    var fullWidth: Bool = true
    var controlSize: ControlSize = .regular
    var disabled: Bool = false
    var cornerRadius: CGFloat = 16
    var padding: CGFloat = 8
    var tint: Color? = nil

    var body: some View {
        Button(action: action) {
            Text(text)
                .padding(padding)
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .controlSize(controlSize)
        .disabled(disabled)
        .cornerRadius(cornerRadius, antialiased: true)
        .tint(tint)
    }
}

struct SecondaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SecondaryButton(text: "Secondary button", action: {})
            SecondaryButton(text: "Disabled", action: {}, disabled: true)
            SecondaryButton(text: "Non full-width", action: {}, fullWidth: false)
        }
        .padding(10)
    }
}
