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
    Annonce(title: "Figurine Son Goku Super Saiyajin GOD III", description: "Jouet dragonballsuper pour le bébé le plus fort du monde", imageName: "placeholder5", location: "Bordeaux", price: 50.0, category: "Jeux / Éveil")
]

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Toute catégorie"
    @State private var selectedLocation = "Toute la france"
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 1000
    @State private var selectedPriceRange: ClosedRange<Double> = 0...1000
    @State private var showPriceSlider = false
    
    let categories = ["Toute catégorie", "Poussette", "Sièges auto", "Chambre", "Chaussure / Vêtements", "Jeux / Éveil", "Livre / Dvd", "Toilette", "Repas", "Sortie", "Service"]
    let locations = ["Toute la france", "Île-de-France", "Centre-Val de Loire", "Bourgogne-Franche-Comté", "Normandie", "Hauts-de-France", "Grand Est", "Pays de la Loire", "Bretagne", "Nouvelle-Aquitaine", "Occitanie", "Auvergne-Rhône-Alpes", "Provence-Alpes-Côte d'Azur", "Corse", "DOM-TOM"]
    
    var filteredAnnonces: [Annonce] {
        annonces.filter { annonce in
            (selectedCategory == "Toute catégorie" || annonce.category == selectedCategory) &&
            (selectedLocation == "Toute la france" || annonce.location == selectedLocation) &&
            (annonce.price >= selectedPriceRange.lowerBound && annonce.price <= selectedPriceRange.upperBound) &&
            (searchText.isEmpty || annonce.title.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Barre de recherche
                TextField("Rechercher des produits pour bébés", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding([.leading, .trailing, .top])
                
                // Filtres de catégorie et localisation côte à côte
                HStack {
                    // Filtre de catégorie
                    Picker("Catégorie", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    // Filtre de localisation
                    Picker("Localisation", selection: $selectedLocation) {
                        ForEach(locations, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding([.leading, .trailing])
                
                // Bouton pour afficher plus de filtres
                Button(action: {
                    showPriceSlider.toggle()
                }) {
                    Text(showPriceSlider ? "Moins de filtres" : "Plus de filtres")
                        .foregroundColor(Color("Accent"))
                }
                .padding()
                
                // Affichage du slider de prix uniquement si l'option est activée
                if showPriceSlider {
                    VStack(alignment: .leading) {
                        Text("Prix : \(Int(selectedPriceRange.lowerBound))€ - \(Int(selectedPriceRange.upperBound))€")
                            .padding([.leading, .trailing])
                        
                        // Slider avec deux boutons (min et max)
                        RangeSlider(range: $selectedPriceRange, rangeLimits: minPrice...maxPrice, step: 10)
                            .padding([.leading, .trailing])
                    }
                }
                
                // Liste des annonces filtrées
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
                .navigationTitle("Annonces pour bébés")
            }
        }
    }
}
