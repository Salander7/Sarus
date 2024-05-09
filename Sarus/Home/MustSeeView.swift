//
//  MustSeeView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 17/05/2024.
//

import SwiftUI
import MapKit

struct MustSeeView: View {
    
    let places: [Place] = [
        .init(country: "Cappadocia, Turkey", imageName: "cappadocia", text: "Cappadocia, ancient district in east-central Anatolia, situated on the rugged plateau north of the Taurus Mountains, in the centre of present-day Turkey. The boundaries of the region have varied throughout history.", latitude: 38.640388, longtitude: 34.846306),
        .init(country: "Tromso, Norway", imageName: "Tromso", text: "Located at 69° North, 350 kilometres above The Arctic Circle, Tromsø is a year-round destination, with the promise of Midnight Sun in the summer months, and the alluring possibility of the Aurora Borealis (Northern Lights) once the nights start to draw in.", latitude: 69.649208, longtitude: 18.955324),
        .init(country: "Los Angeles, USA", imageName: "LosAngeles", text: "Los Angeles, situated on the west coast of the United States, is renowned for its diverse culture, entertainment industry, and iconic landmarks. The city's skyline is dominated by landmarks like the Hollywood Sign and Griffith Observatory, reflecting its status as the entertainment capital of the world.", latitude: 34.052235, longtitude: -118.243683),
        .init(country: "Tokyo, Japan", imageName: "tokyo", text: "Tokyo, the bustling capital of Japan, is a vibrant metropolis known for its cutting-edge technology, rich history, and dynamic culture. The city's skyline is a mesmerizing blend of futuristic skyscrapers and historic temples, reflecting its unique blend of tradition and innovation.", latitude: 35.652832, longtitude: 139.839478),
        .init(country: "New York, USA", imageName: "newYork", text: "New York, often dubbed The Empire State or The Big Apple, is one of the most iconic and culturally diverse cities in the world. Located in the northeastern United States, it is renowned for its stunning skyline dominated by landmarks like the Empire State Building and One World Trade Center. The city is a global hub for finance, commerce, art, fashion, and entertainment, boasting world-class museums such as the Metropolitan Museum of Art and the Museum of Modern Art.", latitude: 40.730610, longtitude: -73.935242),
        .init(country: "Cape Town, South Africa", imageName: "capeTown", text: "Cape Town, nestled on the southwestern tip of South Africa, is a captivating city renowned for its stunning natural beauty, rich cultural heritage, and diverse attractions. With the iconic Table Mountain as its backdrop, the city offers breathtaking vistas of the Atlantic Ocean and a unique blend of urban sophistication and natural wonders. Cape Town's vibrant cultural scene is reflected in its colorful neighborhoods like Bo-Kaap, known for its brightly painted houses and Cape Malay heritage.", latitude: -33.918861, longtitude: 18.423300),
        .init(country: "London, UK", imageName: "london", text: "London, the vibrant capital of the United Kingdom, is a dynamic metropolis renowned for its rich history, diverse culture, and iconic landmarks. The city's skyline is a captivating mix of historic architecture and modern skyscrapers, showcasing its evolution over centuries. At the heart of London lies the bustling district of Westminster, home to iconic landmarks such as the Houses of Parliament, Big Ben, and Westminster Abbey.", latitude: 51.509865, longtitude: -0.118092),
        .init(country: "Paris, France", imageName: "paris", text: "Paris,the enchanting capital of France,is a romantic and cultural epicenter renowned for its timeless beauty,artistic legacy,and iconic landmarks.The city's skyline is a seamless fusion of grand boulevards,historic monuments,and elegant architecture,epitomizing its status as the City of Light.", latitude: 48.866667, longtitude: 2.333333),
        .init(country: "Mexico City, Mexico", imageName: "mexicoCity", text: "Mexico City,the vibrant capital of Mexico,is a sprawling metropolis teeming with history,culture,and energy.The city's skyline is a captivating blend of colonial architecture,modern skyscrapers,and ancient ruins,reflecting its rich and diverse heritage.At the heart of Mexico City lies the historic Zócalo,one of the largest public squares in the world,home to iconic landmarks such as the Metropolitan Cathedral and the National Palace.", latitude: 19.4263, longtitude: -99.1266),
        .init(country: "Rome, Italy", imageName: "rome", text: "Rome,the eternal city and capital of Italy,is a living museum of history, culture, and art. The city's skyline is an iconic panorama of ancient ruins, Renaissance palaces, and Baroque churches, telling the story of its illustrious past. At the heart of Rome lies the majestic Colosseum, a testament to the grandeur of ancient Rome, while nearby, the Roman Forum and Palatine Hill offer glimpses into the city's imperial glory.", latitude: 41.89193, longtitude: 12.51133),
        .init(country: "Mumbai, India", imageName: "mumbai", text: "Mumbai, the bustling metropolis and financial capital of India, is a city of contrasts, blending rich history with modernity. The city's skyline is a mix of towering skyscrapers, colonial-era buildings, and bustling markets, reflecting its vibrant energy and diversity.", latitude: 19.076090, longtitude: 72.877426),
        .init(country: "Beijing, China", imageName: "beijing", text: "Beijing,the capital of China,is a city steeped in history and culture,blending ancient traditions with modern advancements.The city's skyline is a dynamic mix of imperial palaces,ancient temples,and modern skyscrapers,reflecting its rich past and vibrant present.At the heart of Beijing lies the Forbidden City,a vast imperial palace complex that offers a glimpse into China's dynastic history.", latitude: 39.908638, longtitude: 116.370438),
        .init(country: "Miami, USA", imageName: "miami", text: "Miami,the vibrant coastal city in Florida,is renowned for its stunning beaches,cultural diversity,and lively nightlife.The city's skyline is a striking blend of modern high-rises and historic Art Deco architecture,reflecting its dynamic character.At the heart of Miami lies South Beach,famous for its pristine sands,clear waters,and vibrant Ocean Drive lined with pastel-colored buildings.", latitude: 25.793449, longtitude: -80.139198),
        .init(country: "Bangkok, Thailand", imageName: "bangkok", text: "Bangkok, the vibrant capital of Thailand, is a bustling metropolis known for its rich cultural heritage, dynamic street life, and stunning temples. The city's skyline is a captivating mix of modern skyscrapers, traditional Thai architecture, and historic sites, reflecting its unique blend of old and new.", latitude: 13.668217, longtitude: 100.614021),
        .init(country: "Lima, Peru", imageName: "lima", text: "Lima,the vibrant capital of Peru,is a city rich in history,culture,and culinary excellence.The city's skyline is a captivating blend of colonial architecture,modern buildings,and ancient ruins,reflecting its diverse heritage.At the heart of Lima lies the historic Plaza Mayor,home to iconic landmarks such as the Government Palace and the Lima Cathedral.Nearby,the bohemian district of Barranco offers a lively arts scene with colorful murals,charming cafes,and a bustling nightlife.", latitude: -12.046374, longtitude: -77.042793),
        .init(country: "Dubai, UAE", imageName: "duabi", text: "Dubai,the dazzling metropolis in the United Arab Emirates,is renowned for its futuristic architecture,luxurious lifestyle,and cultural diversity.The city's skyline is dominated by iconic structures such as the Burj Khalifa,the world's tallest building,and the sail-shaped Burj Al Arab,reflecting its ambition and opulence.", latitude: 25.276987, longtitude: 55.296249),
        .init(country: "Rio De Janeiro, Brazil", imageName: "rio", text:"Rio de Janeiro,often referred to simply as Rio,is a vibrant city in Brazil renowned for its stunning natural landscapes,lively culture,and festive atmosphere.The city's skyline is dominated by iconic landmarks such as the Christ the Redeemer statue atop Corcovado Mountain and the Sugarloaf Mountain,offering breathtaking views of the surrounding area.", latitude: -22.970722, longtitude: -43.182365),
        .init(country: "Istanbul, Turkey", imageName: "istanbul", text: "Istanbul,the vibrant metropolis spanning two continents,is a city steeped in history,culture,and architectural marvels.The city's skyline is a mesmerizing blend of ancient landmarks,modern skyscrapers,and bustling markets,reflecting its rich and diverse heritage.", latitude: 41.015137, longtitude: 28.979530)
    ]
    
    var body: some View {
           VStack {
               HStack {
                   Text("Must See")
                       .font(.system(size: 16, weight: .semibold))
                   Spacer()
                   Text("View More")
                       .font(.system(size: 12, weight: .semibold))
                       .foregroundStyle(.secondary)
               }
               .padding(.horizontal)
               .padding(.top)
               
               ScrollView(.horizontal) {
                   HStack(spacing: 8) {
                       ForEach(places, id: \.self) { place in
                           NavigationLink(destination: MustSeeDetailsView(place: place)) {
                               MustSeeTile(place: place)
                                   .padding(.bottom, 8)
                           }
                       }
                   }
                   .padding(.horizontal)
               }
           }
       }
   }

   struct MustSeeDetailsView: View {
       
       let place: Place
       
       @State private var region: MKCoordinateRegion
       
       init(place: Place) {
           self.place = place
         
           _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
           
          
       }
       
       var body: some View {
           ScrollView {
               Image(place.imageName)
                   .resizable()
                   .scaledToFill()
                 
               HStack {
                   VStack(alignment: .leading) {
                       Text(place.country)
                           .font(.system(size: 22, weight: .semibold))
                       Spacer()
                       Spacer()
                       Spacer()
                       Text(place.text)
                           .font(.system(size: 17, weight: .regular))
                   }
                   
                   Spacer()
               }
               .padding(.top, 15)
               .padding(.horizontal)
               
               HStack {
                   Text("Located In ⤵")
                       .font(.system(size: 18, weight: .semibold))
                   Spacer()
               }.padding(.horizontal)
                   .padding(.top, 20)
               
             
               Map(coordinateRegion: $region)
                   .frame(height: 400) 
                   .padding(.top, 20)
           }
           .navigationTitle("")
           .navigationBarTitleDisplayMode(.inline)
       }
   }

   struct MustSeeTile: View {
       let place: Place
       var body: some View {
           GeometryReader { geometry in
               VStack(alignment: .leading, spacing: 50) {
                   Image(place.imageName)
                       .resizable()
                       .scaledToFill()
                       .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
                       .clipped()
                   Text(place.country)
                       .font(.system(size: 14, weight: .semibold))
                       .padding(.horizontal, 8)
                       .padding(.top, -41)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .foregroundStyle(.black)
               }
               .frame(width: geometry.size.width, height: geometry.size.height)
           }
           .frame(width: 200, height: 130)
           .background(Color(.init(white: 0.99, alpha: 0.9)))
           .clipShape(RoundedRectangle(cornerRadius: 6))
           .shadow(color: .gray, radius: 2, x: 0.0, y: 1)
       }
   }

   #Preview {
       MustSeeView()
   }
