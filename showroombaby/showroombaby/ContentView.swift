import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(annonces) { annonce in
                NavigationLink(destination: AnnonceDetailView(annonce: annonce)) {
                    HStack {
                        Text(annonce.title)
                            .foregroundColor(Color("RoseText")) // Texte en rose
                    }
                }
            }
            .navigationTitle("Annonces")
        }
    }
}

// Structure pour représenter une annonce
struct Annonce: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

// Données simulées
let annonces = [
    Annonce(title: "Voiture d'occasion", description: "Belle voiture en bon état"),
    Annonce(title: "Appartement à louer", description: "Appartement spacieux"),
    Annonce(title: "Vélo à vendre", description: "Vélo en très bon état"),
    Annonce(title: "Télévision d'occasion", description: "Télévision HD 42 pouces")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
