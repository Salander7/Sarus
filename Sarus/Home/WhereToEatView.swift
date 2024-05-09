//
//  WhereToEatView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 17/05/2024.
//

import SwiftUI

struct WhereToEatView: View {
    
    let foods: [Foods] = [
        
       
        .init(name: "🇨🇴 Colombian Flavors, Rhythms of the Land", imageName: "Bogotá, Colombia"),
        .init(name: "🇺🇸 The Greatest Tiki Bars In America", imageName: "Sip ‘n Dip Lounge, montana, usa"),
        .init(name: "🇹🇭 Bangkok's Finest Restaurants", imageName: "547 Thanon Phlap Phla Chai"),
        .init(name: "🇦🇪 The Best Dubai Marina Restaurants And Bars", imageName: "DREAM, Dubai"),
        .init(name: "🇹🇷 Istanbul’s Most Picturesque Dining Experiences", imageName: "Feriye Restaurant, istanbul"),
        .init(name: "🇲🇽 Our Favorite New Mexican Foods", imageName: "La Posta, new mexico"),
        .init(name: "🇧🇷 Rio's Coolest Bars For An Amazing Night Out", imageName: "Rio Scenarium-rio")
       
        
    ]
    
    var body: some View {

            VStack {
                HStack {
                    Text("Dining & Drinks")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer()
                    Text("View More")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                }.padding(.horizontal)
                    .padding(.top)
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(foods, id: \.self) { food in
                            NavigationLink(destination: WhereToEatDetailsView(restaurant: food), label: { FoodTile(food: food)})
                          
                            
                        }
                    }.padding(.horizontal)
                        .padding(.bottom)
                }
            }
        }
    }



struct FoodTile: View {
    let food: Foods
    var body: some View {
        HStack(spacing: 1) {
            Image(food.imageName)
                .resizable()
                .scaledToFill()
                .clipped()
            
       
            HStack {
                Text(food.name)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                 
            }
        }
        .frame(width: 250, height: 70)
        .background(Color(.init(white: 0.99, alpha: 0.9)))
        .clipShape(.rect(cornerRadius: 6))
        .shadow(color: .gray, radius: 1, x: 1, y: 0)
    }
}

#Preview {
    WhereToEatView()
}
