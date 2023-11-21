//
//  ChartsView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class ChartsView: BaseView {
    
    private let yAxisView = YaxisView()
    private let xAxisView = XaxisView()
    
    private let chartView = UIView()
    
    func configure(with data: [ChartsView.Data]) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
    }
}

extension ChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
        chartView.backgroundColor = .systemPink
    }
}

extension ChartsView {
    struct Data {
        let title: String
        let value: Int
    }
}
