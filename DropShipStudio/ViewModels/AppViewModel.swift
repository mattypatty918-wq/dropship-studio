import Foundation
import MapKit

final class AppViewModel: ObservableObject {
    @Published var selectedTab: AppTab = .dashboard
    @Published var selectedPlan: String = "Growth"
    @Published var campaignCaption: String = "Fresh content for winning products, published everywhere at once."
    @Published var region: MKCoordinateRegion = MockServices.shared.region
    @Published var pendingConnections: [SocialPlatform] = [.youtube, .x]

    let metrics = MockServices.shared.metrics
    let accounts = MockServices.shared.accounts
    let clips = MockServices.shared.clips
    let campaigns = MockServices.shared.campaigns
    let messages = MockServices.shared.messages
    let plans = MockServices.shared.plans
    let adminInsights = MockServices.shared.adminInsights

    func togglePendingConnection(_ platform: SocialPlatform) {
        if let index = pendingConnections.firstIndex(of: platform) {
            pendingConnections.remove(at: index)
        } else {
            pendingConnections.append(platform)
        }
    }
}

enum AppTab: String, CaseIterable {
    case dashboard
    case studio
    case campaigns
    case chat
    case admin

    var title: String {
        switch self {
        case .dashboard: return "Home"
        case .studio: return "Studio"
        case .campaigns: return "Publish"
        case .chat: return "Coach"
        case .admin: return "Admin"
        }
    }

    var icon: String {
        switch self {
        case .dashboard: return "square.grid.2x2.fill"
        case .studio: return "film.stack.fill"
        case .campaigns: return "paperplane.fill"
        case .chat: return "bubble.left.and.exclamationmark.bubble.right.fill"
        case .admin: return "person.crop.rectangle.stack.fill"
        }
    }
}
