import SwiftUI

@main
struct DropShipStudioApp: App {
    @StateObject private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(appViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
