import SwiftUI

struct PolicyUploadView: View {
    @EnvironmentObject private var appState: AppState
    @State private var hasSelectedFile = false
    @State private var uploadProgress: Double = 0
    @State private var isUploading = false

    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 12) {
                Text("Sube tu póliza en PDF")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Aceptamos archivos PDF de hasta 10 MB. Nos encargaremos de procesarla de forma segura.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 48)

            VStack(spacing: 16) {
                Button(action: simulateFileSelection) {
                    VStack(spacing: 8) {
                        Image(systemName: "doc.badge.plus")
                            .font(.largeTitle)
                        Text(hasSelectedFile ? "poliza_auto_2024.pdf" : "Seleccionar archivo")
                            .fontWeight(.medium)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                }

                if isUploading {
                    VStack(alignment: .leading, spacing: 8) {
                        ProgressView(value: uploadProgress, total: 1)
                        Text("Procesando documento...")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .transition(.opacity)
                }
            }

            Spacer()

            Button(action: handleContinue) {
                Text("Continuar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(hasSelectedFile ? Color.accentColor : Color(.systemGray5))
                    .foregroundColor(hasSelectedFile ? .white : .secondary)
                    .cornerRadius(12)
            }
            .disabled(!hasSelectedFile || isUploading)
        }
        .padding(24)
        .navigationTitle("Carga de póliza")
    }

    private func simulateFileSelection() {
        hasSelectedFile = true
        isUploading = true
        uploadProgress = 0

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if uploadProgress >= 1 {
                timer.invalidate()
                isUploading = false
            } else {
                uploadProgress += 0.2
            }
        }
    }

    private func handleContinue() {
        guard hasSelectedFile, !isUploading else { return }
        let summary = PolicySummary(
            policyName: "Seguro Auto Premium 2024",
            coverageHighlights: [
                "Responsabilidad civil hasta $100,000",
                "Cobertura de daños materiales con deducible 5%",
                "Asistencia vial 24/7"
            ],
            deductibleInformation: "Deducible de 5% para pérdidas parciales y 10% para robo total.",
            validity: "Vigente hasta 12/12/2024"
        )
        appState.goToSummary(with: summary)
    }
}

#if DEBUG
struct PolicyUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyUploadView()
            .environmentObject(PreviewMocks.authenticatedState)
    }
}
#endif
