import SwiftUI

extension Color {
    static let surface = Color(red: 0.07, green: 0.09, blue: 0.14)
    static let surfaceRaised = Color(red: 0.11, green: 0.13, blue: 0.20)
    static let accentStart = Color(red: 0.29, green: 0.58, blue: 0.98)
    static let accentEnd = Color(red: 0.49, green: 0.34, blue: 0.98)
    static let successGlow = Color(red: 0.18, green: 0.84, blue: 0.62)
    static let warningGlow = Color(red: 0.97, green: 0.67, blue: 0.18)
    static let dangerGlow = Color(red: 1.00, green: 0.39, blue: 0.45)
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.68)
}

struct AppGradient {
    static let hero = LinearGradient(
        colors: [.accentStart, .accentEnd],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let panel = LinearGradient(
        colors: [Color.surfaceRaised, Color.surface],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct AppShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .accentStart.opacity(0.18), radius: 28, x: 0, y: 14)
    }
}

extension View {
    func appShadow() -> some View {
        modifier(AppShadow())
    }
}
