//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 24.11.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    
    static let id = "TrainingCellView"
    
    private let checkmarkView: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.Overview.oval
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 13)
        label.textColor = Resources.Colors.inActive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    private let rightArrow: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.Overview.rightArrow
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        
        checkmarkView.image = isDone ? Resources.Images.Overview.checked : Resources.Images.Overview.oval
        
        switch roundedType {
        case .all: self.roundCorners([.allCorners], radius: 6)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 6)
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 6)
        }
    }
    
}

private extension TrainingCellView {
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrow)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rightArrow.heightAnchor.constraint(equalToConstant: 12),
            rightArrow.widthAnchor.constraint(equalToConstant: 6),
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
    }
}
