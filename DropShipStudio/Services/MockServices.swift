import Foundation
import MapKit

final class MockServices {
    static let shared = MockServices()

    let metrics: [DashboardMetric] = [
        .init(title: "Gross sales", value: "$28.4k", delta: "+18%", tint: .successGlow),
        .init(title: "ROAS", value: "3.8x", delta: "+0.6", tint: .accentStart),
        .init(title: "Videos shipped", value: "126", delta: "+24", tint: .warningGlow),
        .init(title: "Connected channels", value: "6", delta: "Live", tint: .accentEnd)
    ]

    let accounts: [SocialAccount] = [
        .init(platform: .tiktok, handle: "@trendforge", followers: "42.8k", connected: true),
        .init(platform: .instagram, handle: "@trendforge.store", followers: "18.1k", connected: true),
        .init(platform: .facebook, handle: "TrendForge Shop", followers: "12.4k", connected: true),
        .init(platform: .youtube, handle: "TrendForge Ads", followers: "9.7k", connected: false),
        .init(platform: .pinterest, handle: "TrendForge Pins", followers: "7.2k", connected: true),
        .init(platform: .x, handle: "@trendforgeai", followers: "5.3k", connected: false)
    ]

    let clips: [ProductClip] = [
        .init(name: "Portable blender hook", duration: "0:18", format: "UGC Reel", status: "Ready"),
        .init(name: "Before/after posture brace", duration: "0:25", format: "Story Ad", status: "Editing"),
        .init(name: "Pet hair remover demo", duration: "0:14", format: "Short", status: "Scheduled")
    ]

    let campaigns: [CampaignDraft] = [
        .init(productName: "Portable Blender", hook: "Make smoothies anywhere in 10 seconds", channels: [.tiktok, .instagram, .facebook], scheduledTime: "Today · 5:30 PM"),
        .init(productName: "Posture Corrector", hook: "Visible change after one week", channels: [.youtube, .pinterest], scheduledTime: "Tomorrow · 11:00 AM")
    ]

    let messages: [ChatMessage] = [
        .init(text: "Generate 3 hooks for a kitchen gadget under $30.", isUser: true),
        .init(text: "Try: ‘The Amazon gadget moms keep stealing from each other’, ‘POV: Your old blender finally gets replaced’, and ‘This tiny device killed my $6 coffee habit’.", isUser: false),
        .init(text: "Now turn that into a TikTok caption and CTA.", isUser: true),
        .init(text: "Caption: Fresh smoothies, zero excuses. CTA: Tap to see why this sells out every weekend.", isUser: false)
    ]

    let plans: [SubscriptionPlan] = [
        .init(name: "Starter", price: "$29/mo", features: ["3 social connections", "20 exports/month", "Basic analytics"], highlighted: false),
        .init(name: "Growth", price: "$79/mo", features: ["Unlimited social connections", "AI hooks and captions", "Team chat", "Priority notifications"], highlighted: true),
        .init(name: "Scale", price: "$199/mo", features: ["White-label exports", "Admin controls", "Advanced attribution", "Creator geo discovery"], highlighted: false)
    ]

    let adminInsights: [AdminInsight] = [
        .init(title: "Failed YouTube token refresh", detail: "Reconnect 2 creator accounts before auto-post queue pauses.", severity: "High"),
        .init(title: "Top converting format", detail: "UGC comparison videos produced 28% more clicks this week.", severity: "Info"),
        .init(title: "Billing save opportunity", detail: "12 users are near Growth plan limits and fit upsell automation.", severity: "Medium")
    ]

    let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
        span: MKCoordinateSpan(latitudeDelta: 3.5, longitudeDelta: 3.5)
    )
}
