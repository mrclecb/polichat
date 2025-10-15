import Foundation
import SwiftUI

#if DEBUG
struct PreviewMocks {
    static var sampleSummary: PolicySummary {
        PolicySummary(
            policyName: "Seguro Auto Premium 2024",
            coverageHighlights: [
                "Responsabilidad civil hasta $100,000",
                "Cobertura de daños materiales con deducible 5%",
                "Asistencia vial 24/7"
            ],
            deductibleInformation: "Deducible de 5% para pérdidas parciales y 10% para robo total.",
            validity: "Vigente hasta 12/12/2024"
        )
    }

    static var authenticatedState: AppState {
        let state = AppState()
        state.isAuthenticated = true
        state.navigationPath = NavigationPath()
        return state
    }

    static var unauthenticatedState: AppState {
        AppState()
    }
}
#endif
