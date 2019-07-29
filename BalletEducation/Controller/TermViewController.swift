//
//  TermViewController.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/5/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit
import AVFoundation

class TermViewController: UIViewController {
    var wordModel: Term? = nil

    let speakButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = true

        button.setImage(UIImage(named: "speaker"), for: .normal)
        return button
    }()
    fileprivate let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpStackView()
        speakButton.addTarget(self, action: #selector(speak), for: .touchUpInside)
    }
    
    func labelViewMaker (color: UIColor, text: String, font: UIFont ) -> UILabel {
        let label = UILabel()
        let labelAttribute = NSAttributedString(string: text, attributes:
            [NSAttributedString.Key.foregroundColor: color,
             NSAttributedString.Key.font: font])
        label.attributedText = labelAttribute
        return label
    }
    
    func textViewMaker (color: UIColor, text: String, font: UIFont ) -> UITextView {
        let label = UITextView()
        let labelAttribute = NSAttributedString(string: text, attributes:
            [NSAttributedString.Key.foregroundColor: color,
             NSAttributedString.Key.font: font])
        label.attributedText = labelAttribute
        return label
    }
    
    func setUpStackView() {
        let nameLabel = labelViewMaker(color: .black, text: wordModel!.name, font: UIFont(name: "Raleway-Bold", size: 30)!)
        nameLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

        
        let titleStack = UIStackView(arrangedSubviews: [nameLabel, speakButton])
        
        
        let translationLabel = labelViewMaker(color: .lightGray, text: "Translation: ", font: UIFont(name: "Raleway-Medium", size: 20)!)
        translationLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        let translationText = textViewMaker(color: .darkGray, text: wordModel!.translation, font: UIFont(name: "Raleway-Medium", size: 20)!)
//        translationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let translationStack = UIStackView(arrangedSubviews: [translationLabel,translationText])
        translationStack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let definitionLabel = labelViewMaker(color: .lightGray, text: "Definition: ", font: UIFont(name: "Raleway-Medium", size: 20)!)
        definitionLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        let definitionText = textViewMaker(color: .darkGray, text: wordModel!.definition, font: UIFont(name: "Raleway-Medium", size: 20)!)
        definitionText.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping

        let definitionStack = UIStackView(arrangedSubviews: [definitionLabel, definitionText])
        definitionStack.heightAnchor.constraint(equalToConstant: CGFloat(max( ((wordModel!.definition.count + 2) /  16) * 25, 60))).isActive = true
        
        
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.sd_setImage(with: URL(string: wordModel!.imageUrl))
        var verticalStack = UIStackView()
        if view.frame.width > 900 {
//            image.heightAnchor.constraint(lessThanOrEqualToConstant: 650).isActive = true
            image.heightAnchor.constraint(greaterThanOrEqualToConstant: 450).isActive = true
              verticalStack = UIStackView(arrangedSubviews: [titleStack,translationStack,definitionStack, image, UIView()])
        } else {
            image.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor)
            verticalStack = UIStackView(arrangedSubviews: [titleStack,translationStack,definitionStack, image])
        }
        verticalStack.axis = .vertical
        verticalStack.spacing = 5
        verticalStack.distribution = .fill
        
        
        view.addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(top: 8, left: 10, bottom: 8, right: 10))


    }
    
    @objc func speak() {
        let utterance = AVSpeechUtterance(string: wordModel?.name ?? "Hello")
        utterance.voice = AVSpeechSynthesisVoice(language: "fr")
        synthesizer.speak(utterance)
        
    }
}
