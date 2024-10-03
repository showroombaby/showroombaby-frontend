import SwiftUI

struct MessagerieView: View {
    var body: some View {
        VStack {
            Text("Votre messagerie")
                .font(.largeTitle)
                .foregroundColor(Color("RoseText"))
                .padding()

            List(0..<10) { index in
                HStack {
                    Text("Message \(index + 1)")
                    Spacer()
                    Image(systemName: "envelope")
                }
                .padding()
            }
        }
        .navigationTitle("Messagerie")
    }
}

