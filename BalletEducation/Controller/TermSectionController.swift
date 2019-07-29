//
//  TermSectionController.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/5/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit

class TermSectionController: UIViewController {
    var barreButton = UIButton(type: .custom)
    var turnButton = UIButton(type: .custom)
    var jumpButton = UIButton(type: .custom)
    var positionsButton = UIButton(type: .custom)
    var travelingButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false

        self.view.addSubview(barreButton)
        styleButton(button: barreButton, image: "barreButton", title: "Barre")
        styleButton(button: turnButton, image: "turnButton", title: "Turns")
        styleButton(button: jumpButton, image: "jumpButton", title: "Jumps")
        styleButton(button: positionsButton, image: "positionButton", title: "Positions")
        styleButton(button: travelingButton, image: "travelingButton", title: "Travel Steps")
        setUpButtons()
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        guard let pageTitle = sender.currentAttributedTitle?.string else { return}
        
        let sectionTerms = APIService.allTerm.filter { (term) -> Bool in
            term.category.contains(pageTitle)
            
        }
        let nextView = SectionController(setUpTerms: sectionTerms)

//        nextView.searchController.searchBar.isHidden = true
//        nextView.title = pageTitle
//        nextView.navigationController?.navigationBar.prefersLargeTitles = false
//        nextView.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func styleButton(button: UIButton, image: String, title: String){
        button.addTarget(self, action: #selector(buttonClick(_:) ), for: .touchUpInside)
        let attribute = NSAttributedString(string: title, attributes:
        [NSAttributedString.Key.foregroundColor: UIColor.black,
         NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 28)!])
        button.setAttributedTitle(attribute, for: .normal)
        button.setBackgroundImage(UIImage(named: image), for: .normal)
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        
    }
    
    func setUpHorizontalStacks(button1: UIButton, button2: UIButton) -> UIStackView {
        let horrizontalStack = UIStackView(arrangedSubviews: [button1, button2])
        horrizontalStack.spacing = 40
        horrizontalStack.distribution = .fillEqually
        horrizontalStack.axis = .horizontal
        return horrizontalStack
    }
    
    func setUpButtons() {

    
        let verticalStack = UIStackView(arrangedSubviews:
            [
            setUpHorizontalStacks(button1: positionsButton, button2: barreButton),
            setUpHorizontalStacks(button1: jumpButton, button2: turnButton), travelingButton            ])
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 50

        view.addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(top: 20, left: 30, bottom: 20, right: 30))
    }
    
    
}
