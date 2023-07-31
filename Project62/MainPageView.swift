//
//  MainPageVIew.swift
//  Project62
//
//  Created by Wilda Akmalia on 31/07/23.
//

import Foundation
import SwiftUI

struct MainPageView : View {
    private var data:  [Int] = Array(1...6)
    private let colors: [Color] = [.red, .yellow, .blue, .green]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body : some View {
        NavigationStack {
            ZStack {
                
                Color.cyan.edgesIgnoringSafeArea(.all)
                    .navigationTitle("Main Page")
                
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 25) {
                        
                        NavigationLink(destination: CatView(), label: {
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("All About Cats")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .opacity(0.8)
                                        .padding()
                                }
                            }
                        })
                        
                        NavigationLink(destination: DogView(), label: {
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .topTrailing, endPoint: .bottomLeading))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("Pict of Dogs")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .padding()
                                }
                            }
                        })
                        
                        NavigationLink(destination: AgeView(), label: {
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("Guess The Age")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .padding()
                                }
                            }
                        })
                        
                        NavigationLink(destination: GenderView(), label: {
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .trailing, endPoint: .leading))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("Guess The Gender")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .padding()
                                }
                            }
                        })
                        
                        NavigationLink(destination: IPInfoView(), label:{
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("IP for Info")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .padding()
                                }
                            }
                        })
                        
                        NavigationLink(destination: JokesView(), label: {
                            ZStack{
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [Color.indigo, Color.pink], startPoint: .bottomTrailing, endPoint: .topLeading))
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                VStack{
                                    Text("One-Line Jokes")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30, weight: .medium, design: .rounded))
                                        .padding()
                                }
                            }
                        })
                    }
                }
                .padding()
                .navigationTitle("Main Menu")
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
