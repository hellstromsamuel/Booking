
//
//  PrimaryButton.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    var action: () -> Void
    var fullWidth: Bool = true
    var controlSize: ControlSize = .regular
    var disabled: Bool = false
    var cornerRadius: CGFloat = 18
    var padding: CGFloat = 10

    var body: some View {
        Button(action: action) {
            Text(text)
                .padding(padding)
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .fontWeight(.semibold)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(controlSize)
        .disabled(disabled)
        .cornerRadius(cornerRadius, antialiased: true)
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            PrimaryButton(text: "Primary button", action: {})
            PrimaryButton(text: "Primary button", action: {}, disabled: true)
            PrimaryButton(text: "Non full-width", action: {}, fullWidth: false)
        }
        .padding(10)
    }
}
