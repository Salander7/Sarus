//
//  CreatorDetailsView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 05/06/2024.
//

import SwiftUI
import Kingfisher

struct UserDetails: Decodable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}

class CreatorDetailsVM: ObservableObject {
    
    @Published var userDetails: UserDetails?
    
    init(userId: Int) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
              
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let error {
                    print(error.localizedDescription)
                }
                print(data)
            }
           
        }.resume()
    }
}

struct CreatorDetailsView: View {
    
    @ObservedObject var vm: CreatorDetailsVM
    
    let user: Creators
    
    init(user: Creators) {
        self.user = user
        self.vm = .init(userId: user.id)
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(user.imageName)
                    .resizable()
                    .clipped()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .shadow(radius: 8)
                    .padding(.top)
                
                Text("\(self.vm.userDetails?.firstName ?? "") \(self.vm.userDetails?.lastName ?? "")")

                    .font(.system(size: 17, weight: .semibold))
                HStack {
                    Text("@\(self.vm.userDetails?.username ?? "")")
                        .font(.system(size: 17, weight: .regular))
                   
                }
                Text("Streamer, Explorer")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color(.gray))
                HStack(spacing: 40) {
                    
                 
                    
                    VStack {
                        
                        Text("\(vm.userDetails?.following ?? 0)")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Subscribers")
                            .font(.system(size: 13, weight: .regular))
                    }
                    VStack {
                        Text("\(vm.userDetails?.followers ?? 0)")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Subscriptions")
                            .font(.system(size: 13, weight: .regular))
                    }
                }
                
                HStack(spacing: 14) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Subscribe")
                      
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.vertical, 7)
                        .background(Color.indigo)
                        .clipShape(.buttonBorder)
                        .shadow(radius: 2)
                      
                    })
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Message")
                              
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.vertical, 7)
                        .background(Color.pink)
                        .clipShape(.buttonBorder)
                        .shadow(radius: 2)
                    })
                    
                }
                
                ForEach(vm.userDetails?.posts ?? [], id: \.self) { post in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                        HStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 45)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(post.title)
                                Text("\(post.views) Views")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                            
                            }
                                            
                        }.padding(.horizontal, 7)
                        
                        HStack {
                            ForEach(post.hashtags, id: \.self) { hashtag in
                                Text("   #\(hashtag)")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                        }
                      
                        }
                      
                    }.padding(.bottom, 9)
                     

                    .background(Color(white: 1))
                    .clipShape(.rect(cornerRadius: 6))
                    .shadow(color: .init(white: 0.9), radius: 5, x: 0, y: 4)
                }
                
            }.padding(.horizontal)
          
        }  .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    NavigationStack {
        CreatorDetailsView(user: .init(id: 0, name: "Amy Adams", imageName: "amy"))
    }
   
}
