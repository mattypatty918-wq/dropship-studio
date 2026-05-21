import Foundation
import SwiftUI

struct DashboardMetric: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let delta: String
    let tint: Color
}

struct SocialAccount: Identifiable {
    let id = UUID()
    let platform: SocialPlatform
    let handle: String
    let followers: String
    let connected: Bool
}

enum SocialPlatform: String, CaseIterable, Identifiable {
    case tiktok = "TikTok"
    case instagram = "Instagram"
    case facebook = "Facebook"
    case youtube = "YouTube"
    case pinterest = "Pinterest"
    case x = "X"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .tiktok: return "music.note.tv"
        case .instagram: return "camera.filters"
        case .facebook: return "person.2.fill"
        case .youtube: return "play.rectangle.fill"
        case .pinterest: return "pin.fill"
        case .x: return "bubble.left.and.bubble.right.fill"
        }
    }
}

struct ProductClip: Identifiable {
    let id = UUID()
    let name: String
    let duration: String
    let format: String
    let status: String
}

struct CampaignDraft: Identifiable {
    let id = UUID()
    let productName: String
    let hook: String
    let channels: [SocialPlatform]
    let scheduledTime: String
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct SubscriptionPlan: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let features: [String]
    let highlighted: Bool
}

struct AdminInsight: Identifiable {
    let id = UUID()
    let title: String
    let detail: String
    let severity: String
}
