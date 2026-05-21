import SwiftUI

struct RootTabView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            DashboardView()
                .tabItem { Label(AppTab.dashboard.title, systemImage: AppTab.dashboard.icon) }
                .tag(AppTab.dashboard)

            VideoStudioView()
                .tabItem { Label(AppTab.studio.title, systemImage: AppTab.studio.icon) }
                .tag(AppTab.studio)

            CampaignsView()
                .tabItem { Label(AppTab.campaigns.title, systemImage: AppTab.campaigns.icon) }
                .tag(AppTab.campaigns)

            MarketingCoachView()
                .tabItem { Label(AppTab.chat.title, systemImage: AppTab.chat.icon) }
                .tag(AppTab.chat)

            AdminView()
                .tabItem { Label(AppTab.admin.title, systemImage: AppTab.admin.icon) }
                .tag(AppTab.admin)
        }
        .tint(.white)
        .background(Color.surface.ignoresSafeArea())
    }
}
