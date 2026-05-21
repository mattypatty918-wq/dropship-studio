import SwiftUI
import MapKit

struct DashboardView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    hero
                    SectionHeader(title: "Performance", subtitle: "Revenue, ROAS, publishing velocity, and connected channels")
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(viewModel.metrics) { metric in
                            GlassCard {
                                VStack(alignment: .leading, spacing: 12) {
                                    Circle()
                                        .fill(metric.tint.opacity(0.22))
                                        .frame(width: 40, height: 40)
                                        .overlay(Image(systemName: "sparkles").foregroundStyle(metric.tint))
                                    Text(metric.title)
                                        .foregroundStyle(Color.textSecondary)
                                    Text(metric.value)
                                        .font(.system(size: 28, weight: .bold, design: .rounded))
                                        .foregroundStyle(Color.textPrimary)
                                    Text(metric.delta)
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundStyle(metric.tint)
                                }
                            }
                        }
                    }

                    SectionHeader(title: "Creator geo radar", subtitle: "Location-based discovery for influencer outreach and local trend testing")
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Map(coordinateRegion: $viewModel.region)
                                .frame(height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                            HStack {
                                Label("Los Angeles and surrounding regions", systemImage: "mappin.and.ellipse")
                                    .foregroundStyle(Color.textPrimary)
                                Spacer()
                                Text("52 creators nearby")
                                    .foregroundStyle(Color.successGlow)
                            }
                            Text("Use this module to prioritize local collaborations, creator UGC sourcing, and regional ad testing.")
                                .foregroundStyle(Color.textSecondary)
                        }
                    }

                    SectionHeader(title: "Connected social accounts", subtitle: "Monitor channel status before pushing product campaigns live")
                    VStack(spacing: 12) {
                        ForEach(viewModel.accounts) { account in
                            GlassCard {
                                HStack(spacing: 14) {
                                    Image(systemName: account.platform.icon)
                                        .font(.title2)
                                        .foregroundStyle(account.connected ? Color.successGlow : Color.warningGlow)
                                        .frame(width: 42)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(account.platform.rawValue)
                                            .foregroundStyle(Color.textPrimary)
                                            .font(.headline)
                                        Text("\(account.handle) · \(account.followers) followers")
                                            .foregroundStyle(Color.textSecondary)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    Text(account.connected ? "Connected" : "Reconnect")
                                        .font(.subheadline.weight(.bold))
                                        .foregroundStyle(account.connected ? Color.successGlow : Color.warningGlow)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color.surface.ignoresSafeArea())
            .navigationTitle("DropShip Studio")
        }
    }

    private var hero: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(AppGradient.hero)
                .frame(height: 220)
                .appShadow()
            VStack(alignment: .leading, spacing: 10) {
                Text("Edit once. Sell everywhere.")
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                Text("A modern iPhone growth OS for dropshippers: video editing, AI marketing, payment plans, team chat, account linking, notifications, and geo-based creator discovery.")
                    .foregroundStyle(.white.opacity(0.88))
                HStack(spacing: 10) {
                    Label("Revenue-first", systemImage: "chart.line.uptrend.xyaxis")
                    Label("Multi-posting", systemImage: "paperplane.circle.fill")
                }
                .font(.footnote.weight(.bold))
                .foregroundStyle(.white)
            }
            .padding(22)
        }
    }
}
