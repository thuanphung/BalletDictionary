//
//  SearchController.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/4/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class SearchController: SectionController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var searchResults: [Term]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        collectionView.backgroundColor = .white

        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: reuseIdentifier )

        setUpSearchBar()
    }
    
    
    fileprivate func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResults = nil
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        let filter = APIService.allTerm.filter { (term) -> Bool in
            if let otherNames = term.alternativeNames {
                let otherNamesFilter = otherNames.filter{ $0.range(of: searchText, options: .caseInsensitive) != nil }

                return otherNamesFilter.count != 0 || term.name.folding(options: .diacriticInsensitive, locale: nil).lowercased().contains(searchText.lowercased())            }
            return term.name.folding(options: .diacriticInsensitive, locale: nil).lowercased().contains(searchText.lowercased())
        }
        
        searchResults = filter
        collectionView.reloadData()
        
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        if searchResults == nil {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
        
        
        if let searchModels = searchResults {
            cell.termModel = searchModels[indexPath.item]
        } else {
            cell.termModel = APIService.allTerm[indexPath.item]
        }

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (searchResults?.count) ?? APIService.allTerm.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if searchResults == nil {
            super.collectionView(collectionView, didSelectItemAt: indexPath)
        } else{
            let nextView = TermViewController()
            nextView.wordModel = searchResults![indexPath.item]
            navigationController?.pushViewController(nextView, animated: true)
        }
    }

}
