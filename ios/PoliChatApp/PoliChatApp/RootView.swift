import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        Group {
            if appState.isAuthenticated {
                MainFlowView()
            } else {
                AuthView()
            }
        }
        .animation(.default, value: appState.isAuthenticated)
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
                .environmentObject(PreviewMocks.unauthenticatedState)

            RootView()
                .environmentObject(PreviewMocks.authenticatedState)
        }
    }
}
#endif
