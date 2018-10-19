//
//  NetworkManager.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import Foundation

enum NetworkManager {
    
    static func getRestaurants(completion: @escaping ([Restaurant]) -> Void) {
        let url = URL(string: "https://data.cityofchicago.org/resource/cwig-ma7x.json")!
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase                
                do {
                    let restaurants = try decoder.decode([Restaurant].self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(restaurants)
                    }
                } catch {
                    print(error)
                }
            } else {
                print(response ?? "no response object", error ?? "no error object")
            }
        }.resume()
    }
    
}
