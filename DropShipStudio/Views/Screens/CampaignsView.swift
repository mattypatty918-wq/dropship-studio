import SwiftUI

struct CampaignsView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    SectionHeader(title: "Campaign Publisher", subtitle: "Connect channels, prepare captions, and push product content everywhere")

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Publishing caption")
                                .font(.headline)
                                .foregroundStyle(Color.textPrimary)
                            TextEditor(text: $viewModel.campaignCaption)
                                .scrollContentBackground(.hidden)
                                .frame(height: 120)
                                .padding(12)
                                .background(Color.black.opacity(0.22))
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .foregroundStyle(Color.textPrimary)
                            Text("Connected destinations")
                                .font(.subheadline.weight(.bold))
                                .foregroundStyle(Color.textSecondary)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 10) {
                                ForEach(SocialPlatform.allCases) { platform in
                                    let pending = viewModel.pendingConnections.contains(platform)
                                    Button {
                                        viewModel.togglePendingConnection(platform)
                                    } label: {
                                        VStack(spacing: 10) {
                                            Image(systemName: platform.icon)
                                                .font(.title2)
                                            Text(platform.rawValue)
                                                .font(.footnote.weight(.semibold))
                                        }
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(
                                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                                .fill(pending ? Color.white.opacity(0.08) : Color.accentStart)
                                        )
                                    }
                                }
                            }
                            Button("Publish to selected accounts") {}
                                .buttonStyle(PrimaryButtonStyle())
                        }
                    }

                    SectionHeader(title: "Upcoming campaigns", subtitle: "Your queued cross-post schedule")
                    VStack(spacing: 12) {
                        ForEach(viewModel.campaigns) { campaign in
                            GlassCard {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(campaign.productName)
                                        .font(.headline)
                                        .foregroundStyle(Color.textPrimary)
                                    Text(campaign.hook)
                                        .foregroundStyle(Color.textSecondary)
                                    HStack {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 8) {
                                                ForEach(campaign.channels) { channel in
                                                    Label(channel.rawValue, systemImage: channel.icon)
                                                        .font(.caption.weight(.semibold))
                                                        .padding(.horizontal, 10)
                                                        .padding(.vertical, 8)
                                                        .background(Color.white.opacity(0.08))
                                                        .clipShape(Capsule())
                                                }
                                            }
                                        }
                                        Spacer()
                                    }
                                    Text(campaign.scheduledTime)
                                        .font(.subheadline.weight(.bold))
                                        .foregroundStyle(Color.successGlow)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color.surface.ignoresSafeArea())
            .navigationTitle("Publish")
        }
    }
}
