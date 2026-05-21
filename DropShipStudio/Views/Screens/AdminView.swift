import SwiftUI

struct AdminView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    SectionHeader(title: "Admin Control Center", subtitle: "Manage billing, alerts, account health, and growth opportunities")

                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Account ops")
                                .font(.headline)
                                .foregroundStyle(Color.textPrimary)
                            ForEach(viewModel.adminInsights) { insight in
                                HStack(alignment: .top, spacing: 12) {
                                    Circle()
                                        .fill(color(for: insight.severity))
                                        .frame(width: 12, height: 12)
                                        .padding(.top, 6)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(insight.title)
                                            .foregroundStyle(Color.textPrimary)
                                            .font(.headline)
                                        Text(insight.detail)
                                            .foregroundStyle(Color.textSecondary)
                                    }
                                }
                                .padding(.vertical, 6)
                            }
                        }
                    }

                    NavigationLink {
                        SubscriptionView()
                    } label: {
                        GlassCard {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Billing and plans")
                                        .font(.headline)
                                        .foregroundStyle(Color.textPrimary)
                                    Text("Current plan: \(viewModel.selectedPlan)")
                                        .foregroundStyle(Color.textSecondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .background(Color.surface.ignoresSafeArea())
            .navigationTitle("Admin")
        }
    }

    private func color(for severity: String) -> Color {
        switch severity {
        case "High": return .dangerGlow
        case "Medium": return .warningGlow
        default: return .successGlow
        }
    }
}
