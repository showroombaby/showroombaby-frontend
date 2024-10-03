import SwiftUI

struct ConnexionView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Connexion")
                .font(.largeTitle)
                .foregroundColor(Color("RoseText"))
                .padding(.top, 50)

            TextField("Adresse e-mail", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            SecureField("Mot de passe", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            Button(action: {
                // Ajouter la logique de connexion plus tard
            }) {
                Text("Se connecter")
                    .padding()
                    .background(Color("RoseBackground"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            Spacer()
        }
    }
}
