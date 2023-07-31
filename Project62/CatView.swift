//
//  CatView.swift
//  Project62
//
//  Created by Wilda Akmalia on 31/07/23.
//

import Foundation
import SwiftUI

struct Cat: Hashable, Codable {
    let fact: String
    let length: Int
}

class CatViewModel : ObservableObject {
    @Published var cats : Cat = Cat(fact: "Come click the button and I'll give you a fact ;)", length: 90)
    
    func fetchData() {
        guard let url = URL(string: "https://catfact.ninja/fact") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(Cat.self, from: data)
                DispatchQueue.main.async {
                    self.cats = response
                }
            } catch {
                print("Unexpected error occured: \(error)")
            }
        }
        dataTask.resume()

    }
}

struct CatView: View {
    @StateObject var catViewModel = CatViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                
                Text("**Why you should have a cat?** \n\n\(catViewModel.cats.fact)")
                    .padding(.horizontal, 30)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    catViewModel.fetchData()
                },
                       label: {
                    Text("Give me a fact!")
                        .bold()
                        .frame(width: 300, height: 50)
                        .font(.system(size: 20))
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .navigationBarTitle("Cat Facts", displayMode: .inline)
        }
        
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
