import SwiftUI

@main
struct showroombabyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Accueil")
                    }

                MessagerieView()
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Messagerie")
                    }

                ConnexionView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Connexion")
                    }
            }
        }
    }
}
