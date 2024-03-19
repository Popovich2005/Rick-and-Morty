//
//  RaM.swift
//  Rick and Morty
//
//  Created by Алексей Попов on 16.03.2024.
//

import Foundation

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: URL
    let episode: [URL]
    
}

struct Location: Decodable {
    let name: String
    let url: String
}

//struct Origin: Decodable {
//    let name: String
//    let url: String
//}

struct AllCharacter: Decodable {
    let results: [Character]
}


