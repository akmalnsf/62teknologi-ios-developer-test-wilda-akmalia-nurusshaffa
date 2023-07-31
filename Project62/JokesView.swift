//
//  JokesView.swift
//  Project62
//
//  Created by Wilda Akmalia on 31/07/23.
//

import Foundation
import SwiftUI

struct Jokes: Hashable, Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}

class JokesViewModel : ObservableObject {
    @Published var jokes: Jokes = Jokes(type: "general", setup: "Generate the jokes to make your day\n", punchline: "Bazinga", id: 567)
    
    func fetchData() {
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(Jokes.self, from: data)
                DispatchQueue.main.async {
                    self.jokes = response
                }
            } catch {
                print("Unexpected error occured: \(error)")
            }
        }
        dataTask.resume()
    }
}

struct JokesView: View {
    @StateObject var jokesViewModel = JokesViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                Text("**\(jokesViewModel.jokes.setup)** \n\n\(jokesViewModel.jokes.punchline)")
                    .padding(.horizontal, 30)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    jokesViewModel.fetchData()
                },
                       label: {
                    Text("Generate Jokes")
                        .bold()
                        .frame(width: 300, height: 50)
                        .font(.system(size: 20))
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .navigationBarTitle("One-Line Jokes", displayMode: .inline)
        }
    }
}

struct JokesView_Previews: PreviewProvider {
    static var previews: some View {
        JokesView()
    }
}
