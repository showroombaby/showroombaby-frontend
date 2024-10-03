import SwiftUI

// Structure pour représenter une annonce
struct Annonce: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String // Image associée à l'annonce (placeholder pour l'instant)
    let location: String  // Localisation de l'objet
}

// Données simulées
let annonces = [
    Annonce(title: "Lit bébé en bois qui roule vite", description: "Lit en bois avec matelas inclus, en bon état.", imageName: "placeholder1", location: "Paris"),
    Annonce(title: "Livre tchoupi super ghetto", description: "Livre sur l'histoire de la rue et des stupefiants de chez tchoupi.", imageName: "placeholder2", location: "Lyon"),
    Annonce(title: "Pousette pour bébé", description: "Pousette pour bébé qui est en bon état.", imageName: "placeholder3", location: "Marseille"),
    Annonce(title: "Tapis d'eau pour bébé", description: "Tapis d'eau super special pour bébé.", imageName: "placeholder4", location: "Toulouse"),
    Annonce(title: "Figurine Son Goku Super Saiyajin GOD III", description: "Jouet dragonballsuper pour le bébé le plus fort du monde", imageName: "placeholder5", location: "Bordeaux")
]

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // Barre de recherche
                TextField("Rechercher des produits pour bébés", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding([.leading, .trailing, .top])

                // Liste des annonces
                List(annonces) { annonce in
                    NavigationLink(destination: AnnonceDetailView(annonce: annonce)) {
                        HStack {
                            // Affichage de l'image (placeholder)
                            Image(annonce.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                .padding(.trailing, 10)
                            
                            // Affichage du titre
                            VStack(alignment: .leading) {
                                Text(annonce.title)
                                    .foregroundColor(Color("RoseText"))
                                Text(annonce.location)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }

                // Bouton filtre des offres
                Button(action: {
                    // Logic de filtre à implémenter plus tard
                }) {
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                        Text("Filtrer les offres")
                    }
                    .padding()
                    .background(Color("RoseBackground"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Annonces pour bébés")
        }
    }
}
