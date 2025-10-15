import SwiftUI

struct PolicySummaryView: View {
    @EnvironmentObject private var appState: AppState
    let summary: PolicySummary

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(summary.policyName)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(summary.validity)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Coberturas destacadas")
                        .font(.headline)
                    ForEach(summary.coverageHighlights, id: \.self) { item in
                        Label(item, systemImage: "checkmark.seal.fill")
                            .labelStyle(.titleAndIcon)
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Deducibles")
                        .font(.headline)
                    Text(summary.deductibleInformation)
                }

                Button(action: appState.goToChat) {
                    Text("Chatear con la póliza")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding(24)
        }
        .navigationTitle("Resumen")
    }
}

#if DEBUG
struct PolicySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PolicySummaryView(summary: PreviewMocks.sampleSummary)
            .environmentObject(PreviewMocks.authenticatedState)
    }
}
#endif
