import SwiftUI

struct MainFlowView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack(path: $appState.navigationPath) {
            PolicyUploadView()
                .navigationDestination(for: AppState.Route.self) { route in
                    switch route {
                    case .policyUpload:
                        PolicyUploadView()
                    case let .policySummary(summary):
                        PolicySummaryView(summary: summary)
                    case .policyChat:
                        PolicyChatView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cerrar sesión", role: .destructive) {
                            withAnimation {
                                appState.reset()
                            }
                        }
                    }
                }
        }
    }
}

#if DEBUG
struct MainFlowView_Previews: PreviewProvider {
    static var previews: some View {
        MainFlowView()
            .environmentObject(PreviewMocks.authenticatedState)
    }
}
#endif
