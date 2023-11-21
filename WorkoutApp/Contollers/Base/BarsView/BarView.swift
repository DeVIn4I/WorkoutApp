//
//  BarView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class BarView: BaseView {
    
    private let heightParam: Double
    
    private let valueLabel: UILabel = {
       let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 13)
        label.textColor = Resources.Colors.active
        return label
    }()
    
    private let barView: UIView = {
       let view = UIView()
        view.backgroundColor = Resources.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = Resources.Fonts.helveticalRegular(with: 9)
        label.textColor = Resources.Colors.inActive
        return label
    }()
    
    init(data: Data) {
        self.heightParam = data.heightParam
        super.init(frame: .zero)
        
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 6),
            barView.widthAnchor.constraint(equalToConstant: 16),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightParam * 0.8)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}

extension BarView {
    struct Data {
        let value: String
        let title: String
        let heightParam: Double
    }
}
