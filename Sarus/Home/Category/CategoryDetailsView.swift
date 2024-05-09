//
//  CategoryDetailsView.swift
//  Sarus
//
//  Created by Deniz Dilbilir on 22/05/2024.
//

import SwiftUI
import Kingfisher


class ExploreCategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [EventPlace]()
    @Published var errorMessage = ""
    
    init(name: String) {
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Oops! Something went wrong: \(statusCode)"
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    self.places = try JSONDecoder().decode([EventPlace].self, from: data)
                } catch {
                   print("JSON decoding failure:", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false

            }
        }.resume()
        
        }
    }



struct CategoryDetailsView: View {
    
    private let name: String
   @ObservedObject private var vm: ExploreCategoryDetailsViewModel
    
    init(name: String) {
        print("Finished loading CategoryDetailsView for \(name)")
        self.name = name
        self.vm = .init(name: name)
    }
    
//    let name: String
//
//    @ObservedObject var vm = ExploreCategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ActivityIndicatorView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ZStack {
                    if !vm.errorMessage.isEmpty {
                        VStack() {
                            Image(systemName: "exclamationmark.shield")
                                .font(.system(size: 60, weight: .regular))
                                .foregroundStyle(.pink)
                                .padding()
                            Text(vm.errorMessage)
                        }
                       
                    }
                   
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(spacing: 0) {
                                KFImage(URL(string: place.thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .padding()
                                    .font(.system(size: 17, weight: .semibold))
                                    .clipShape(RoundedRectangle(cornerRadius: 2))
                            }
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(6)
                            .shadow(color: Color(UIColor.label).opacity(0.1), radius: 5, x: 0, y: 2)
                            .padding()
                        }
                    }
                }
         
            }
        }
        .navigationTitle(self.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack {
        CategoryDetailsView(name: "Food")
    }
}
