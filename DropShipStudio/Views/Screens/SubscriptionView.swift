import SwiftUI

struct SubscriptionView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                SectionHeader(title: "Plans", subtitle: "Monetize creators, teams, and agencies with tiered subscriptions")
                ForEach(viewModel.plans) { plan in
                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(plan.name)
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.textPrimary)
                                    Text(plan.price)
                                        .foregroundStyle(plan.highlighted ? Color.successGlow : Color.textSecondary)
                                }
                                Spacer()
                                if plan.highlighted {
                                    Text("Best value")
                                        .font(.caption.weight(.bold))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 8)
                                        .background(AppGradient.hero)
                                        .clipShape(Capsule())
                                }
                            }
                            ForEach(plan.features, id: \.self) { feature in
                                Label(feature, systemImage: "checkmark.circle.fill")
                                    .foregroundStyle(Color.textPrimary)
                            }
                            Button(plan.name == viewModel.selectedPlan ? "Current plan" : "Choose \(plan.name)") {
                                viewModel.selectedPlan = plan.name
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.surface.ignoresSafeArea())
        .navigationTitle("Subscription")
    }
}
