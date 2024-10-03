import SwiftUI

struct DiscussionView: View {
    var message: Message
    @State private var newMessage = ""
    @State private var messagesList: [(text: String, isUser: Bool)] = []
    @Environment(\.presentationMode) var presentationMode  // Pour fermer la vue
    
    // Liste de réponses aléatoires du vendeur
    let randomResponses = [
        "Oui, c'est toujours disponible !",
        "Désolé, c'est déjà vendu.",
        "Je peux vous offrir une réduction si vous êtes intéressé.",
        "Je peux vous envoyer plus de photos si besoin.",
        "Merci pour votre intérêt, mais le produit est déjà réservé."
    ]
    
    var body: some View {
        VStack {
            // Informations de l'annonce en haut
            VStack(alignment: .leading) {
                HStack {
                    Image(message.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text(message.intituléAnnonce)
                            .font(.headline)
                        Text(message.nomPrenom)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    // Bouton pour fermer la vue
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                    }
                }
                .padding()
            }
            .background(Color.gray.opacity(0.1)) // Fond gris clair
            .cornerRadius(10)
            .padding()
            
            Spacer()
            
            // Liste des messages
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messagesList, id: \.text) { message in
                        HStack {
                            if message.isUser {
                                Spacer()  // Pousser les messages de l'utilisateur à droite
                                Text(message.text)
                                    .padding(10)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(maxWidth: 250, alignment: .trailing)
                            } else {
                                // Message du vendeur
                                HStack(alignment: .bottom) {
                                    Image(self.message.imageName)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.trailing, 10)
                                    
                                    Text(message.text)
                                        .padding(10)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 250, alignment: .leading)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Champ de texte pour ajouter un nouveau message
            HStack {
                TextField("Nouveau message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    // Ajouter le nouveau message de l'utilisateur
                    if !newMessage.isEmpty {
                        messagesList.append((text: newMessage, isUser: true))
                        newMessage = ""
                        
                        // Réponse aléatoire du vendeur après un léger délai
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let randomReply = randomResponses.randomElement() ?? "Merci pour votre message."
                            messagesList.append((text: randomReply, isUser: false))
                        }
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                }
            }
            .background(Color.white)
        }
        .navigationTitle("Discussion avec \(message.nomPrenom)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionView(message: messages[0])
    }
}
