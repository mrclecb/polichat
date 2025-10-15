# PoliChat iOS App

Este directorio contiene la base del proyecto iOS construido en SwiftUI siguiendo el roadmap definido en la documentación de diseño. La iteración actual cubre la autenticación básica y la navegación entre las vistas principales.

## Estructura
- `PoliChatApp.swift`: Punto de entrada de la app.
- `AppState.swift`: Modelo de estado global con control de autenticación y navegación.
- `RootView.swift`: Decide entre mostrar la vista de autenticación o el flujo principal.
- `AuthView.swift`: Formulario de registro/inicio de sesión con validaciones básicas.
- `MainFlowView.swift`: Navegación entre carga de póliza, resumen y chat.
- `PolicyUploadView.swift`: Simulación de selección y carga de un PDF.
- `PolicySummaryView.swift`: Muestra un resumen estático de la póliza.
- `PolicyChatView.swift`: Chat simulado en espera de integración con el LLM.

## Próximos pasos
Consulta el [roadmap de la documentación de diseño](../docs/polichat_app_design.md#roadmap-sugerido) para conocer los siguientes hitos.
