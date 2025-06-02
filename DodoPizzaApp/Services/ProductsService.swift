//
//  ProductsService.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 08/05/2025.
//

class ProductsService {

    private let products: [Product] = [
        Product(name: "Гавайская", detail: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", detail: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni"),
        Product(name: "Cheesy", detail: "Cheese, cream, pepper", price: 710, image: "default"),
        Product(name: "Dodo", detail: "Tomatoes, onion, mozarella", price: 710, image: "default")
    ]

    func fetchProducts() -> [Product] {
        return products
    }
}
