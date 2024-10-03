import SwiftUI

struct AnnonceDetailView: View {
    var annonce: Annonce
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Affichage de la photo (placeholder)
            Image(annonce.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                .padding(.bottom, 10)

            // Titre de l'annonce
            Text(annonce.title)
                .font(.largeTitle)
                .foregroundColor(Color("RoseText"))
                .padding(.bottom, 10)

            // Localisation de l'objet
            HStack {
                Image(systemName: "mappin.circle.fill")
                Text(annonce.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            // Description de l'annonce
            Text(annonce.description)
                .font(.body)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            // Bouton pour contacter le vendeur
            Button(action: {
                // Ajoute une action ici, par exemple, imprimer un message
                print("Bouton contact cliqué")
            }) {
                Text("Contacter le vendeur")
                    .padding()
                    .background(Color("RoseBackground"))
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
