# PoliChat iOS App

Este directorio contiene la base del proyecto iOS construido en SwiftUI siguiendo el roadmap definido en la documentación de diseño. La iteración actual cubre la autenticación básica y la navegación entre las vistas principales.

## Estructura
- `PoliChatApp.xcodeproj`: Proyecto de Xcode listo para compilar y ejecutar la app.
- `PoliChatApp.swift`: Punto de entrada de la app.
- `AppState.swift`: Modelo de estado global con control de autenticación y navegación.
- `RootView.swift`: Decide entre mostrar la vista de autenticación o el flujo principal.
- `AuthView.swift`: Formulario de registro/inicio de sesión con validaciones básicas.
- `MainFlowView.swift`: Navegación entre carga de póliza, resumen y chat.
- `PolicyUploadView.swift`: Simulación de selección y carga de un PDF.
- `PolicySummaryView.swift`: Muestra un resumen estático de la póliza.
- `PolicyChatView.swift`: Chat simulado en espera de integración con el LLM.
- `PreviewMocks.swift`: Datos de ejemplo y estados preconfigurados para las `SwiftUI Previews`.
- `Assets.xcassets`: Catálogo de recursos (incluye AppIcon placeholder).
- `PreviewContent/Preview Assets.xcassets`: Recursos usados en las previsualizaciones.

## Cómo ejecutar en Xcode
1. Abre `ios/PoliChatApp/PoliChatApp.xcodeproj` con Xcode 15 o superior.
2. Selecciona el esquema **PoliChatApp** y el simulador iOS de tu preferencia (iPhone 15 recomendado).
3. Presiona `Cmd + R` para compilar y lanzar la app. No se requiere configuración adicional de cuentas o servicios.

## SwiftUI Previews
- Cada vista principal incluye un `PreviewProvider` con dependencias mock gracias a `PreviewMocks`.
- Asegúrate de que el destino de previsualización esté en **iOS 17** para aprovechar los `NavigationStack`.
- Puedes personalizar los datos de las previews duplicando y editando `PreviewMocks.sampleSummary` o creando nuevos estados mock.

## Próximos pasos
Consulta el [roadmap de la documentación de diseño](../docs/polichat_app_design.md#roadmap-sugerido) para conocer los siguientes hitos.
