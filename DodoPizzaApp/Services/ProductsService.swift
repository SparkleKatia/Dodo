//
//  ProductsService.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/05/2025.
//
import UIKit
class ProductsService {

    private let products: [Product] = [
        Product(name: "Гавайская", detail: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", detail: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni"),
        Product(name: "Cheesy", detail: "Cheese, cream, pepper", price: 710, image: "default"),
        Product(name: "Dodo", detail: "Tomatoes, onion, mozarella", price: 710, image: "default")
    ]

    func fetchProducts(completion: @escaping ([Product])->()) {
        
        guard let url = URL.init(string: "http://localhost:3003/products") else { return }
        
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
                let products = try decoder.decode([Product].self, from: data)
                print(Thread.current)
                DispatchQueue.main.async {
                    completion(products)
                }
               
            } catch {
                print(error)
            }
            
        }
        dataTask.resume()
        
    }
}
