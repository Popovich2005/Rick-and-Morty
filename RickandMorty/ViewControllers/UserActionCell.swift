//
//  UserActionCell.swift
//  Rick and Morty
//
//  Created by Алексей Попов on 16.03.2024.
//

import UIKit

class UserActionCell: UICollectionViewCell {
    
    @IBOutlet var userActionImage: UIImageView!    
    
    private let networkManager = NetworkManager.shared
    
    func configure(with character: Character) {
        networkManager.fetchImage(from: character.image) { [unowned self] result in
            switch result {
            case .success(let imageData):
                userActionImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
