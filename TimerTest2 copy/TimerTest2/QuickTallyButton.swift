//
//  QuickTallyButton.swift
//  TimerTest2
//
//  Created by Colton Swapp on 4/19/21.
//

import UIKit

class QuickTallyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configureButton() {
        layer.cornerRadius = 10
        clipsToBounds = true
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.contentHorizontalAlignment = .left
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
}
