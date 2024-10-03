import SwiftUI

// Structure pour représenter un message dans la messagerie
struct Message: Identifiable {
    let id = UUID()
    let nomPrenom: String
    let imageName: String  // Image de profil (placeholder pour l'instant)
    let intituléAnnonce: String
    let dateDernierMessage: String
}

// Données simulées de la messagerie
let messages = [
    Message(nomPrenom: "Marie Dupont", imageName: "profile1", intituléAnnonce: "Lit bébé en bois qui roule vite", dateDernierMessage: "02/10/2024"),
    Message(nomPrenom: "Paul Martin", imageName: "profile2", intituléAnnonce: "Livre tchoupi super ghetto", dateDernierMessage: "01/10/2024"),
    Message(nomPrenom: "Julie Moreau", imageName: "profile3", intituléAnnonce: "Pousette pour bébé", dateDernierMessage: "28/09/2024"),
    Message(nomPrenom: "Lucie Lefevre", imageName: "profile4", intituléAnnonce: "Tapis d'eau pour bébé", dateDernierMessage: "25/09/2024"),
    Message(nomPrenom: "Emma Dubois", imageName: "profile5", intituléAnnonce: "Figurine Son Goku Super Saiyajin GOD III", dateDernierMessage: "20/09/2024")
]

struct MessagerieView: View {
    var body: some View {
        NavigationView {
            List(messages) { message in
                NavigationLink(destination: DiscussionView(message: message)) {
                    HStack {
                        // Image de profil (placeholder)
                        Image(message.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .padding(.trailing, 10)
                        
                        // Détails du message
                        VStack(alignment: .leading) {
                            // Nom et prénom en petit
                            Text(message.nomPrenom)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            // Intitulé de l'annonce en gras
                            Text(message.intituléAnnonce)
                                .font(.headline)
                                .bold()
                        }
                        
                        Spacer()
                        
                        // Date du dernier message à droite
                        Text(message.dateDernierMessage)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Messagerie")
        }
    }
}

struct MessagerieView_Previews: PreviewProvider {
    static var previews: some View {
        MessagerieView()
    }
}
