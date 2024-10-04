import SwiftUI

// Définition de la structure Annonce
struct Annonce: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String // Image associée à l'annonce (placeholder pour l'instant)
    let location: String  // Localisation de l'objet
    let price: Double // Prix de l'objet
    let category: String // Catégorie de l'objet
}

// Données simulées pour les annonces
let annonces = [
    Annonce(title: "Lit bébé en bois qui roule vite", description: "Lit en bois avec matelas inclus, en bon état.", imageName: "placeholder1", location: "Paris", price: 200.0, category: "Chambre"),
    Annonce(title: "Livre tchoupi super ghetto", description: "Livre sur l'histoire de la rue et des stupefiants de chez tchoupi.", imageName: "placeholder2", location: "Lyon", price: 10.0, category: "Livre / Dvd"),
    Annonce(title: "Pousette pour bébé", description: "Pousette pour bébé qui est en bon état.", imageName: "placeholder3", location: "Marseille", price: 150.0, category: "Poussette"),
    Annonce(title: "Tapis d'eau pour bébé", description: "Tapis d'eau super special pour bébé.", imageName: "placeholder4", location: "Toulouse", price: 30.0, category: "Jeux / Éveil"),
    Annonce(title: "Figurine Son Goku Super Saiyajin GOD III", description: "Jouet dragonballsuper pour le bébé le plus fort du monde", imageName: "placeholder5", location: "Bordeaux", price: 50.0, category: "Jeux / Éveil"),
    // Ajout d'articles supplémentaires
    Annonce(title: "Table à langer bébé", description: "Table à langer en excellent état.", imageName: "placeholder6", location: "Nice", price: 100.0, category: "Chambre"),
    Annonce(title: "Chaise haute bébé", description: "Chaise haute ajustable pour bébé.", imageName: "placeholder7", location: "Lille", price: 75.0, category: "Chambre"),
    Annonce(title: "Jouet éducatif musical", description: "Jouet musical pour éveil des bébés.", imageName: "placeholder8", location: "Nantes", price: 25.0, category: "Jeux / Éveil")
]

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Toute catégorie"
    @State private var selectedLocation = "Toute la france"
    @State private var minPriceInput: String = "0"
    @State private var maxPriceInput: String = "1000"
    
    let categories = ["Toute catégorie", "Poussette", "Sièges auto", "Chambre", "Chaussure / Vêtements", "Jeux / Éveil", "Livre / Dvd", "Toilette / Santé"]

    // Validation des champs pour n'accepter que des chiffres
    var filteredAnnonces: [Annonce] {
        let minPrice = Double(minPriceInput.filter { "0123456789.".contains($0) }) ?? 0
        let maxPrice = Double(maxPriceInput.filter { "0123456789.".contains($0) }) ?? 1000
        
        return annonces.filter { annonce in
            (selectedCategory == "Toute catégorie" || annonce.category == selectedCategory) &&
            (selectedLocation == "Toute la france" || annonce.location == selectedLocation) &&
            annonce.price >= minPrice &&
            annonce.price <= maxPrice &&
            (searchText.isEmpty || annonce.title.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Ajout d'espace entre le logo et la search bar
                Spacer().frame(height: 20)
                
                // Search bar plus large en hauteur
                TextField("Rechercher des produits pour bébés", text: $searchText)
                    .padding(15)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding([.leading, .trailing])
                    .frame(height: 60)

                // Alignement des menus de catégories et localisation avec espacement
                HStack(spacing: 20) {
                    Menu {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                            }
                        }
                    } label: {
                        Text(selectedCategory)
                        Image(systemName: "chevron.down")
                    }
                    .padding(.leading)

                    Spacer()

                    Menu {
                        Button("Toute la france") {
                            selectedLocation = "Toute la france"
                        }
                        Button("Paris") {
                            selectedLocation = "Paris"
                        }
                        Button("Lyon") {
                            selectedLocation = "Lyon"
                        }
                        Button("Marseille") {
                            selectedLocation = "Marseille"
                        }
                        Button("Toulouse") {
                            selectedLocation = "Toulouse"
                        }
                        Button("Bordeaux") {
                            selectedLocation = "Bordeaux"
                        }
                        Button("Nice") {
                            selectedLocation = "Nice"
                        }
                        Button("Lille") {
                            selectedLocation = "Lille"
                        }
                        Button("Nantes") {
                            selectedLocation = "Nantes"
                        }
                    } label: {
                        Text(selectedLocation)
                        Image(systemName: "chevron.down")
                    }
                    .padding(.trailing)
                }

                // Champs de texte pour entrer les prix avec un espacement optimisé
                HStack(spacing: 20) {
                    TextField("Prix min", text: $minPriceInput)
                        .keyboardType(.numberPad)
                        .padding(15)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: 100, height: 50)

                    TextField("Prix max", text: $maxPriceInput)
                        .keyboardType(.numberPad)
                        .padding(15)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(width: 100, height: 50)
                }
                .padding([.leading, .trailing])

                List {
                    if filteredAnnonces.isEmpty {
                        Text("Aucun élément ne correspond à la recherche.")
                    } else {
                        ForEach(filteredAnnonces) { annonce in
                            NavigationLink(destination: AnnonceDetailView(annonce: annonce)) {
                                HStack {
                                    Image(annonce.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                        .padding(.trailing, 10)

                                    VStack(alignment: .leading) {
                                        Text(annonce.title)
                                            .foregroundColor(Color("RoseText"))
                                        Text("\(annonce.price, specifier: "%.0f")€")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text(annonce.location)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarItems(leading:
                Image("annonceImage") // Remplace "annonceImage" par ton image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 40)
            )
        }
    }
}
