//
//  SectionController.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/5/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class SectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var keyTerm: [Term]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: reuseIdentifier )
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 130)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        keyTerm = APIService.allTerm
    }
    
    init(setUpTerms: [Term]) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        keyTerm = setUpTerms
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        cell.termModel = keyTerm![indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  keyTerm!.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let nextView = TermViewController()
            if let searchModels = keyTerm {
                nextView.wordModel = searchModels[indexPath.item]
            } else {
            nextView.wordModel = APIService.allTerm[indexPath.item]
            }
            navigationController?.pushViewController(nextView, animated: true)
    }
}
