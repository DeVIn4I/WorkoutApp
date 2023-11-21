//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 20.11.2023.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case averagePace(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .heartRate(let value):
            return .init(image: Resources.Images.Session.heartBeat,
                         value: "\(value) bpm",
                         title: Resources.Strings.Session.heartRate.uppercased()
            )
        case .averagePace(let value):
            return .init(image: Resources.Images.Session.speed,
                         value: "\(value) / km",
                         title: Resources.Strings.Session.averagePace.uppercased()
            )
        case .totalSteps(let value):
            return .init(image: Resources.Images.Session.steps,
                         value: "\(value)",
                         title: Resources.Strings.Session.stepsCounter.uppercased()
            )
        case .totalDistance(let value):
            return .init(image: Resources.Images.Session.map,
                         value: "\(value) km",
                         title: Resources.Strings.Session.totalDistance.uppercased()
            )
        }
    }
}

final class StatsItemView: BaseView {
    
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 10)
        label.textColor = Resources.Colors.inActive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
    }
}

extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        
        setupView(imageView)
        setupView(stackView)
        
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            imageView.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
