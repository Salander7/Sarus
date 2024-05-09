//
//  RisingContentCreatorsView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 17/05/2024.
//

import SwiftUI

struct RisingContentCreatorsView: View {
    
    let creators: [Creators] = [
        .init(id: 0, name: "Amy", imageName: "amy"),
        .init(id: 1, name: "Billy", imageName: "billy"),
        .init(id: 2, name: "Sam", imageName: "sam"),
      
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Rising Content Creators")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("View More")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(creators, id: \.self) { creator in
                    
                        NavigationLink(
                            destination: NavigationLazyView(CreatorDetailsView(user: creator)),
                         label: {
                             CreatorView(creator: creator)
                        })
                    }
                }.padding(.horizontal)
                    .padding(.bottom)
            }
        }
    }
}

struct CreatorView: View {
    let creator: Creators
    var body: some View {
        VStack {
            Image(creator.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            Text(creator.name)
                .font(.system(size: 13, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
        .frame(width: 60)
    }
}

#Preview {
    RisingContentCreatorsView()
}
