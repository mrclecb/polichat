import SwiftUI

struct AuthView: View {
    @EnvironmentObject private var appState: AppState
    @State private var isRegistering = false
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(isRegistering ? "Crear cuenta" : "Iniciar sesión")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Accede para gestionar tu póliza de seguros")
                        .foregroundColor(.secondary)
                }

                VStack(spacing: 16) {
                    TextField("Correo electrónico", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    if isRegistering {
                        SecureField("Confirmar contraseña", text: $confirmPassword)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                }

                if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                Button(action: handlePrimaryAction) {
                    Text(isRegistering ? "Registrarme" : "Ingresar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1 : 0.6)

                Button(action: { isRegistering.toggle() }) {
                    Text(isRegistering ? "¿Ya tienes cuenta? Inicia sesión" : "¿No tienes cuenta? Regístrate")
                        .font(.footnote)
                        .foregroundColor(.accentColor)
                }

                Spacer()
            }
            .padding(24)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Ayuda") {
                        Button("Recuperar contraseña") {}
                        Button("Contactar soporte") {}
                    }
                }
            }
            .alert("Funcionalidad no disponible", isPresented: .constant(false)) {
                Button("Entendido", role: .cancel) {}
            }
        }
    }

    private var isFormValid: Bool {
        guard !email.isEmpty, !password.isEmpty else { return false }
        if isRegistering {
            return password == confirmPassword && password.count >= 8
        }
        return true
    }

    private func handlePrimaryAction() {
        errorMessage = nil
        guard isFormValid else {
            errorMessage = "Revisa los campos ingresados"
            return
        }
        withAnimation {
            appState.isAuthenticated = true
            appState.navigationPath = NavigationPath([AppState.Route.policyUpload])
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(AppState())
    }
}
