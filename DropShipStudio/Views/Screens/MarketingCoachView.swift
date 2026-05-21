import SwiftUI

struct MarketingCoachView: View {
    @EnvironmentObject private var viewModel: AppViewModel
    @State private var draft = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 14) {
                SectionHeader(title: "AI Marketing Coach", subtitle: "Generate hooks, scripts, CTAs, and launch ideas with your team")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            HStack {
                                if message.isUser { Spacer() }
                                Text(message.text)
                                    .padding(14)
                                    .foregroundStyle(.white)
                                    .background(message.isUser ? AppGradient.hero : LinearGradient(colors: [Color.surfaceRaised, Color.surfaceRaised], startPoint: .leading, endPoint: .trailing))
                                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                                    .frame(maxWidth: 300, alignment: message.isUser ? .trailing : .leading)
                                if !message.isUser { Spacer() }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                GlassCard {
                    VStack(spacing: 12) {
                        TextField("Ask for hooks, scripts, or ad angles", text: $draft)
                            .textFieldStyle(.plain)
                            .padding(14)
                            .background(Color.black.opacity(0.22))
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .foregroundStyle(Color.textPrimary)
                        HStack(spacing: 12) {
                            Button("Send") {}
                                .buttonStyle(PrimaryButtonStyle())
                            Button("Open team chat") {}
                                .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.surface.ignoresSafeArea())
            .navigationTitle("Coach")
        }
    }
}
