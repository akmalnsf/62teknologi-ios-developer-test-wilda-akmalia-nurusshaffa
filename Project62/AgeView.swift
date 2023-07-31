//
//  AgeView.swift
//  Project62
//
//  Created by Wilda Akmalia on 31/07/23.
//

import Foundation
import SwiftUI

struct Person: Hashable, Codable {
    let count: Int
    let name: String
    let age: Int
}

class AgeViewModel : ObservableObject {
    @Published var person : Person = Person(count: 0, name: "Mahmood", age: 79)
    
    @Published var name = ""
    
    func fetchData() {
        guard let url = URL(string: "https://api.agify.io/?name=\(name)") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(Person.self, from: data)
                DispatchQueue.main.async {
                    self.person = response
                }
            } catch {
                print("Unexpected error occured: \(error)")
            }
        }
        dataTask.resume()

    }
}

struct AgeView: View {
    @StateObject var ageViewModel = AgeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 90) {
                Text("Your prediction age is:")
                    .padding()
                    .font(.system(size: 24))
                    .frame(width: 300)
                
                Text("\(ageViewModel.person.age)")
                    .padding()
                    .font(.system(size: 60))
                    .fontWeight(.semibold)
                
                TextField("Insert the name here", text: $ageViewModel.name)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .font(.system(size: 18))
                    .frame(width: 300, height: 50)
                    .cornerRadius(15)
                
                Button(action: {
                    ageViewModel.fetchData()
                },
                       label: {
                    Text("Guess the age")
                        .bold()
                        .frame(width: 300, height: 50)
                        .font(.system(size: 20))
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .navigationTitle("Guess The Age")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView()
    }
}
