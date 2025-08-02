//
//  IngridientService.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 01/08/2025.
//

import UIKit

final class IngredientService {
    
    func fetchIngredients(for productID: String,
                       completion: @escaping ([Ingredient]) -> Void) {
        
        guard let url = URL.init(string: "http://localhost:3003/products/\(productID)/ingredients") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                
                switch response.statusCode {
                    
                case 400..<500: print("client error")
                case 500..<600: print("server error")
                    
                default: break
                }
            }
            
            guard let data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let ingresients = try decoder.decode([Ingredient].self, from: data)
                print(Thread.current)
                DispatchQueue.main.async {
                    completion(ingresients)
                }
               
            } catch {
                print(error)
            }
            
        }
        dataTask.resume()
        
    }
}
