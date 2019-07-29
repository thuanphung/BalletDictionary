//
//  SearchCell.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/4/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    var termModel: Term! {
        didSet{
            let termAttri = NSAttributedString(string: termModel.name, attributes:
                [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                 NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 16)!])
            termLabel.attributedText = termAttri
            let definitionAttri = NSAttributedString(string: termModel.definition, attributes:
                [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                 NSAttributedString.Key.font: UIFont(name: "Raleway-Regular", size: 14)!])
            
            definitionView.attributedText = definitionAttri
            imageView.sd_setImage(with: URL(string: termModel.imageUrl))
        }
    }
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        iv.contentMode = .scaleAspectFill  
        iv.clipsToBounds = true
        
        return iv
    }()
    
    
    let termLabel: UILabel = {
        let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    } ()
    
    
    let definitionView: UILabel = {
       let text = UILabel()
        text.lineBreakMode = NSLineBreakMode.byWordWrapping
        text.numberOfLines = 0
//        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        let stackView = UIStackView(arrangedSubviews: [termLabel, definitionView])
        stackView.axis = .vertical
        stackView.spacing = 3
        imageView.widthAnchor.constraint(equalToConstant: self.frame.width / 4).isActive = true
        let mainStackView = UIStackView(arrangedSubviews: [stackView, imageView])
        mainStackView.axis = .horizontal
        addSubview(mainStackView)
        mainStackView.fillSuperview(padding: .init(top: 10 , left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    let nextView = TermViewController()
//    if let searchModels = searchTerm {
//        nextView.wordModel = searchModels[indexPath.item]
//    } else {
//    nextView.wordModel = APIService.allTerm[indexPath.item]
//    }
//    navigationController?.pushViewController(nextView, animated: true)
}
