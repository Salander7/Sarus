//
//  WhereToEatDetailsView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 31/05/2024.
//

import SwiftUI
import Kingfisher

struct WhereToEatDetails: Decodable {
    let popularDishes: [Dish]
    let photos: [String]
    let reviews: [Review]
}

struct Review: Decodable, Hashable {
    let user: ReviewsUser
    let rating: Int
    let text: String
}

struct ReviewsUser: Decodable, Hashable {
    let id: Int
    let username, firstName, lastName, profileImage: String
}

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}

class WhereToEatDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var whereToEatDetails: WhereToEatDetails?
    
    init() {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            if let details = try? JSONDecoder().decode(WhereToEatDetails.self, from: data) {
                DispatchQueue.main.async {
                    self.whereToEatDetails = details
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}

struct WhereToEatDetailsView: View {
    @ObservedObject var whereToEatDetailsViewModel = WhereToEatDetailsViewModel()
    let restaurant: Foods
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(restaurant.name)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star")
                            }.foregroundStyle(.yellow)
                        }
                    }
                    Spacer()
                    NavigationLink(
                        destination: WhereToEatPhotosView(),
                     label: {
                         Text("More Images")
                             .foregroundStyle(.white)
                             .font(.system(size: 16, weight: .regular))
                             .frame(width: 70)
                             .multilineTextAlignment(.trailing)
                    })

                }.padding()
            }
            
            VStack(alignment: .leading, spacing: 7) {
              
                Text("🍱 Asian cuisine")
                    .font(.system(size: 18, weight: .semibold))
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign")
                    }.foregroundStyle(.yellow)
                }
                
                Text("Fusing spectacular acrobatic performances, live music, dancers and delectable Mediterranean cuisine, an evening at DREAM does exactly what it says on the tin. Designed by award-winning Arab choreographer Pierre Khadra, shows take place with 15-minute intervals.")
                    .padding(.top, 7)
                    .font(.system(size: 17, weight: .regular))
            }.padding()
            
            HStack {
                Text("Signature Dishes")
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
            }.padding(.horizontal)
            
            if whereToEatDetailsViewModel.isLoading {
                ProgressView()
                    .padding()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(whereToEatDetailsViewModel.whereToEatDetails?.popularDishes ?? [], id: \.self) { dish in
                            SignatureDishesCell(dish: dish)
                        }
                    }.padding(.horizontal)
                        .padding(.bottom)
                }
                
                HStack {
                    Text("Reviews")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }.padding(.horizontal)
                if let reviews = whereToEatDetailsViewModel.whereToEatDetails?.reviews {
                    ForEach(reviews, id: \.self) { review in
                        VStack(alignment: .leading) {
                            HStack {
                                KFImage(URL(string: review.user.profileImage))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55)
                                    .clipShape(.rect(cornerRadius: 6))
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("\(review.user.firstName) \(review.user.lastName)")
                                        .font(.system(size: 16, weight: .semibold))
                                    HStack(spacing: 2) {
                                        ForEach(0..<review.rating, id: \.self) { star in
                                            Image(systemName: "star.fill")
                                                .foregroundStyle(.yellow)
                                            
                                        }
                                        ForEach(0..<5 - review.rating, id: \.self) { star in
                                            Image(systemName: "star.fill")
                                                .foregroundStyle(.gray)
                                            
                                        }
                                    }
                                    .font(.system(size: 13))
                                }
                                    
                                    Spacer()
                                    Text("July 24")
                                        .font(.system(size: 15, weight: .regular))
                                }
                                Text(review.text)
                                .font(.system(size: 16, weight: .regular))
                                
                            } .padding(.top)
                                .padding(.horizontal)
                        }
                    }
                }
            }
                .navigationTitle("Menu & More")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    struct SignatureDishesCell: View {
        let dish: Dish
        var body: some View {
            VStack(alignment: .leading) {
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                
                Text(dish.name)
                    .padding(.leading, 6)
                    .font(.system(size: 17, weight: .semibold))
                Text("\(dish.numPhotos) photos")
                    .padding(.leading, 6)
                    .foregroundStyle(.gray)
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
    
    #Preview {
        NavigationStack {
            WhereToEatDetailsView(restaurant: .init(name: "DREAM", imageName: "DREAM, Dubai"))
        }
    }

    

