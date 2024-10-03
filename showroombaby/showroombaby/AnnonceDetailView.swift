import SwiftUI

struct AnnonceDetailView: View {
    var annonce: Annonce
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(annonce.title)
                .font(.largeTitle)
                .foregroundColor(Color("RoseText")) // Titre en rose
                .padding(.bottom, 10)
            
            Text(annonce.description)
                .font(.body)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            Button(action: {
                // Action de contact
            }) {
                Text("Contacter le vendeur")
                    .padding()
                    .background(Color("RoseBackground")) // Fond rose pour le bouton
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .navigationTitle("Détails de l'annonce")
    }
}

struct AnnonceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnnonceDetailView(annonce: annonces[0])
    }
}
