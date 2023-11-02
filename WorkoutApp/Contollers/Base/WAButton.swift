//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    private var type: WAButtonType = .primary
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        
        self.type = type
        setupView()
        constraintView()
        configureAppearance()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    func setupView() { 
        setupView(label)
        setupView(iconView)
    }
    func constraintView() {
        var horizontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
        ])
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    func configureAppearance() {
        
        switch type {
        case .primary:
            label.textColor = Resources.Colors.inActive
            label.font = Resources.Fonts.helveticalRegular(with: 13)
            iconView.tintColor = Resources.Colors.inActive
        case .secondary:
            label.textColor = Resources.Colors.active
            label.font = Resources.Fonts.helveticalRegular(with: 15)
            iconView.tintColor = Resources.Colors.active

            backgroundColor = Resources.Colors.secondary
            layer.cornerRadius = 14
        }

        makeSystemAnimate(self)
    }
}
