import SwiftUI

struct PolicyChatView: View {
    @State private var messageText = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(role: .assistant, text: "Hola, soy tu asistente de pólizas. ¿En qué puedo ayudarte hoy?", timestamp: Date())
    ]

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(messages) { message in
                            ChatBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(16)
                }
                .background(Color(.systemGroupedBackground))
                .onChange(of: messages.count) { _ in
                    if let last = messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()

            HStack(spacing: 12) {
                TextField("Escribe tu mensaje", text: $messageText, axis: .vertical)
                    .lineLimit(1...4)
                    .textFieldStyle(.roundedBorder)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(canSendMessage ? .accentColor : .gray)
                }
                .disabled(!canSendMessage)
            }
            .padding(16)
            .background(.thinMaterial)
        }
        .navigationTitle("Chat con la póliza")
    }

    private var canSendMessage: Bool { !messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }

    private func sendMessage() {
        guard canSendMessage else { return }
        let userMessage = ChatMessage(role: .user, text: messageText, timestamp: Date())
        messages.append(userMessage)
        messageText = ""

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let assistantResponse = ChatMessage(
                role: .assistant,
                text: "Esta es una respuesta simulada basada en tu póliza. Más adelante se conectará al LLM.",
                timestamp: Date()
            )
            messages.append(assistantResponse)
        }
    }
}

struct ChatMessage: Identifiable, Hashable {
    enum Role {
        case user
        case assistant
    }

    let id = UUID()
    let role: Role
    let text: String
    let timestamp: Date
}

struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .assistant { Spacer() }

            VStack(alignment: .leading, spacing: 8) {
                Text(message.role == .assistant ? "Asistente" : "Tú")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(message.text)
                    .padding(12)
                    .background(message.role == .assistant ? Color(.systemBlue).opacity(0.1) : Color.accentColor.opacity(0.2))
                    .cornerRadius(12)
            }

            if message.role == .user { Spacer() }
        }
    }
}

#if DEBUG
struct PolicyChatView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyChatView()
    }
}
#endif
