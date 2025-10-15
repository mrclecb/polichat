# Diseño de la aplicación iOS "PoliChat"

## Objetivo
Crear una aplicación móvil que permita a los usuarios conversar con el contenido de su póliza de seguro mediante un modelo de lenguaje grande (LLM) con contexto restringido.

## Flujo de usuario
1. **Registro e inicio de sesión**
   - Formulario tradicional de registro/inicio de sesión con autenticación segura.
   - Opción de recuperación de contraseña y validación por correo electrónico.
2. **Pantalla de carga de póliza**
   - Solicita al usuario subir su póliza en formato PDF.
   - Validación de tipo de archivo y tamaño, con retroalimentación clara.
3. **Resumen de póliza**
   - Una vez procesado el PDF, se muestra un resumen generado automáticamente.
   - Incluye metadatos clave (vigencia, coberturas principales, deducibles).
   - Botón "Chatear con la póliza" para acceder al asistente.
4. **Chat contextualizado**
   - Interfaz tipo chat con historial persistente.
   - El backend limita el contexto del LLM a información de seguros y a la póliza cargada.

## Arquitectura propuesta
- **Cliente iOS (SwiftUI)**: Manejo de UI, autenticación y subida de archivos.
- **Backend (Node.js/TypeScript o Python/FastAPI)**: Gestión de usuarios, almacenamiento, procesamiento de PDFs y orquestación de la conversación con el LLM.
- **Procesamiento de documentos**: Extracción de texto, segmentación y generación de embeddings.
- **Vector store (por ejemplo, Pinecone, Weaviate o PostgreSQL con pgvector)** para recuperar fragmentos relevantes.
- **Proveedor LLM**: API de OpenAI, Anthropic u otro modelo ajustado a seguros.

## Componentes clave del cliente iOS
- **AuthView**: Formularios de registro e inicio de sesión.
- **PolicyUploadView**: Selector de archivos, progreso de carga y validaciones.
- **PolicySummaryView**: Muestra el resumen y metadatos extraídos.
- **PolicyChatView**: Chat con burbujas, estado de escritura y control de sesión.

## Consideraciones de seguridad y cumplimiento
- Cifrado de datos en tránsito y en reposo.
- Tokens de acceso renovables y almacenamiento seguro en el llavero de iOS.
- Eliminación o anonimización de información sensible.
- Consentimiento explícito para procesar información personal.

## Roadmap sugerido
1. Implementar autenticación básica y navegación entre vistas.
2. Integrar subida de PDF y servicio de procesamiento.
3. Generar y mostrar resumen de póliza.
4. Configurar vector store y conexión con el LLM.
5. Afinar UX del chat y agregar analíticas básicas.
