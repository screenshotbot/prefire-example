//
//  ButtonComponent.swift
//  PrefireExample
//
//  Created by Claude Code on 9/26/25.
//

import SwiftUI

struct ButtonComponent: View {
    let title: String
    let style: ButtonStyle
    let action: () -> Void

    enum ButtonStyle {
        case primary
        case secondary
        case destructive
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(textColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(12)
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .primary: return .blue
        case .secondary: return .gray.opacity(0.2)
        case .destructive: return .red
        }
    }

    private var textColor: Color {
        switch style {
        case .primary: return .white
        case .secondary: return .primary
        case .destructive: return .white
        }
    }
}

#Preview("Primary Button") {
    ButtonComponent(title: "Continue", style: .primary) {
        print("Primary tapped")
    }
    .padding()
}

#Preview("Secondary Button") {
    ButtonComponent(title: "Cancel", style: .secondary) {
        print("Secondary tapped")
    }
    .padding()
}

#Preview("Destructive Button") {
    ButtonComponent(title: "Delete", style: .destructive) {
        print("Destructive tapped")
    }
    .padding()
}

#Preview("All Buttons") {
    VStack(spacing: 16) {
        ButtonComponent(title: "Continue", style: .primary) {}
        ButtonComponent(title: "Cancel", style: .secondary) {}
        ButtonComponent(title: "Delete", style: .destructive) {}
    }
    .padding()
}