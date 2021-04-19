//
//  CSButton.swift
//  TimerTest2
//
//  Created by Colton Swapp on 4/13/21.
//

import UIKit

class CSButton: UIButton {
    
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.setTitleColor(.black, for: .normal)
        self.setTitle("Missed tackle", for: .normal)
        self.contentHorizontalAlignment = .left
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        configureButton()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.contentHorizontalAlignment = .left

    }
    
    private func configureButton() {
        layer.cornerRadius      = 10
        setTitleColor(.black, for: .normal)
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        label.text = "1"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    
}
