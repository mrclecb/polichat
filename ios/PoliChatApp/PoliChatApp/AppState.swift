import Foundation
import SwiftUI

final class AppState: ObservableObject {
    enum Route: Hashable {
        case policyUpload
        case policySummary(PolicySummary)
        case policyChat
    }

    @Published var isAuthenticated = false
    @Published var navigationPath = NavigationPath()

    func reset() {
        isAuthenticated = false
        navigationPath = NavigationPath()
    }

    func goToSummary(with summary: PolicySummary) {
        navigationPath.append(Route.policySummary(summary))
    }

    func goToChat() {
        navigationPath.append(Route.policyChat)
    }
}

struct PolicySummary: Hashable {
    var policyName: String
    var coverageHighlights: [String]
    var deductibleInformation: String
    var validity: String
}
