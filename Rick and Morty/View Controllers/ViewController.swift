//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Алексей Попов on 16.03.2024.
//

import UIKit

let linkURL = URL(string: "https://rickandmortyapi.com/api/character")!

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRickAndMorty()
    }
}

// MARK: - Network
extension ViewController {
    private func fetchRickAndMorty() {
        URLSession.shared.dataTask(with: linkURL) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let rickAndMortys = try JSONDecoder().decode(Characters.self, from: data)
                print(rickAndMortys)

            } catch {
                print(error)
            }
        }.resume()
    }
}
