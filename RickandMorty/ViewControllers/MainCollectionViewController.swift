//
//  MainCollectionViewController.swift
//  Rick and Morty
//
//  Created by Алексей Попов on 16.03.2024.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    let numberOfRows = 20
    let numberOfItemsPerRow = 2
    
    private let networkManager = NetworkManager.shared
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
    }
    
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let characterDetailVC = segue.destination as? CharacterDetailViewController
//        characterDetailVC.
              
     }
     
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfRows
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       numberOfItemsPerRow
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else {return UICollectionViewCell()}
        
        cell.userActionImage.image =
//        let character = character[indexPath.item]
//        cell.configure(with: character)

        
//        let originalImage = UIImage(named: "pop") // Замените "имя_изображения" на фактическое имя вашего изображения
//        let resizedImage = resizeImage(image: originalImage ?? UIImage.pop, newWidth: 180) // Установите новую ширину по вашему усмотрению
//    
//        cell.userActionImage.image = resizedImage

        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10 // Расстояние между строками
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10 // Расстояние между ячейками в строке
//    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
//        let scale = newWidth / image.size.width
//        let newHeight = image.size.height * scale
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage!
        
        let newHeight = newWidth
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!

    }
}

// MARK: - Network
extension MainCollectionViewController {
    private func fetchAllCharacter() {
        networkManager.fetchAllCharacter(from: Link.characterURL.url) { result in
            switch result {
            case .success(let allCharacter):
                print(allCharacter)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
