//
//  ExploreCategoriesView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 17/05/2024.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct ExploreCategoriesView: View {
    let categories: [Category] = [
        .init(name: "History", imageName: "history"),
        .init(name: "Art", imageName: "art"),
        .init(name: "Gigs", imageName: "gigs"),
        .init(name: "Sports", imageName: "sport"),
        .init(name: "Food", imageName: "food")
        
    ]
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 7) {
                ForEach(categories, id: \.self) { c in
                            NavigationLink(
                                destination: NavigationLazyView(CategoryDetailsView(name: c.name)),
                             label: {
                                 VStack(spacing: -2) {

                                     Image(c.imageName)
                                         .resizable()
                                            .aspectRatio(contentMode: .fill)
                                         .frame(width: 100, height: 90)
                                         .background(Color.white)
                                         .clipShape(.rect(cornerRadius: 6))

                                         .shadow(color: .black, radius: 3, x: 0, y: 1)
                                         .padding(.bottom)
                                     
                                     Text(c.name)
                                         .font(.system(size: 14, weight: .bold))
                                         .foregroundStyle(.white)
                                      
                                 }

                            })
                    
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    
    ExploreView()
    
  
}

