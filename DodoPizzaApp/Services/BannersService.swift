//
//  BannerService.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 03/08/2025.
//

import UIKit

final class BannersService {
    
    func fetchBanners(completion: @escaping ([Banner])-> ()) {
    
        guard let url = URL.init(string: "http://localhost:3003/banners") else { return }
        
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
                let banners = try decoder.decode([Banner].self, from: data)
                print(Thread.current)
                DispatchQueue.main.async {
                    completion(banners)
                }
               
            } catch {
                print(error)
            }
            
        }
        dataTask.resume()
    }
    
}
