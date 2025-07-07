//
//  ProverbViewModel.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 07/07/2025.
//

import Foundation
import Observation

@Observable
class ProverbViewModel {
    var proverbModel = ProverbModel.defaultQuote()

    var url: URL {
        let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL string: \(urlString)")
        }
        
        return url
    }
    
    func getRandomQuote() {
        getQuote(url: url)
    }
    
    private func getQuote(url: URL) {
        // Send a GET request to the Quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Try to get data and any other information
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            let jsonDecoder = JSONDecoder()
            
            // Handling error
            if let error {
                print(error)
                return
            }
            
            // Get data if it is not nil
            guard let data = data else {
                print("No data was returned from request")
                return
            }
            
            do {
                let newProverbModel = try jsonDecoder.decode(ProverbModel.self, from: data)
                DispatchQueue.main.async {
                    self.proverbModel = newProverbModel
                }
            } catch let error {
                print(error)
                print(data.debugDescription)
            }
        }
        
        task.resume()
    }
}
