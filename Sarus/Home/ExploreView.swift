//
//  ContentView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 08/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.indigo, .pink]),  startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color.white
                    .offset(y: 380)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "location.magnifyingglass")
                        Text("Where to next?")
                        Spacer()
                        
                    }
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.7))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.2)))
                    .clipShape(.rect(cornerRadius: 6))
                    .padding(15)
                    
                    ExploreCategoriesView()
                    
                    VStack {
                        
                        MustSeeView()
                        WhereToEatView()
                        RisingContentCreatorsView()
                        
                    } .background(Color.white)
                    
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.top)
                    
                    
                }
            }
            
            .navigationTitle("Explore")
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

