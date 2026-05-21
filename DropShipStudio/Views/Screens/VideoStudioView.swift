import SwiftUI

struct VideoStudioView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    SectionHeader(title: "Video Studio", subtitle: "Build high-converting short-form ads for winning products")

                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Quick edit pipeline")
                                .font(.headline)
                                .foregroundStyle(Color.textPrimary)
                            HStack(spacing: 10) {
                                ForEach(["Import clips", "Trim + captions", "CTA overlay", "Schedule export"], id: \.self) { step in
                                    Text(step)
                                        .font(.footnote.weight(.semibold))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 10)
                                        .background(Color.white.opacity(0.08))
                                        .clipShape(Capsule())
                                }
                            }
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .fill(Color.black.opacity(0.34))
                                .frame(height: 240)
                                .overlay(
                                    VStack(spacing: 12) {
                                        Image(systemName: "play.rectangle.on.rectangle.fill")
                                            .font(.system(size: 56))
                                            .foregroundStyle(.white)
                                        Text("Preview timeline placeholder")
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text("Swap this stub for AVFoundation, CoreImage filters, caption rendering, and export jobs.")
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.white.opacity(0.72))
                                            .padding(.horizontal)
                                    }
                                )
                        }
                    }

                    SectionHeader(title: "Recent product clips", subtitle: "Track production status across your creative pipeline")
                    VStack(spacing: 12) {
                        ForEach(viewModel.clips) { clip in
                            GlassCard {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(clip.name)
                                            .font(.headline)
                                            .foregroundStyle(Color.textPrimary)
                                        Text("\(clip.duration) · \(clip.format)")
                                            .foregroundStyle(Color.textSecondary)
                                    }
                                    Spacer()
                                    Text(clip.status)
                                        .font(.subheadline.weight(.bold))
                                        .foregroundStyle(clip.status == "Ready" ? Color.successGlow : clip.status == "Scheduled" ? Color.accentStart : Color.warningGlow)
                                }
                            }
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("In-app monetization")
                                .font(.headline)
                                .foregroundStyle(Color.textPrimary)
                            Text("Upgrade creators to unlock unlimited exports, AI captions, and autoposting. Wire this to StoreKit 2 or Stripe-backed subscriptions.")
                                .foregroundStyle(Color.textSecondary)
                            NavigationLink("View plans") {
                                SubscriptionView()
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                }
                .padding()
            }
            .background(Color.surface.ignoresSafeArea())
            .navigationTitle("Studio")
        }
    }
}
