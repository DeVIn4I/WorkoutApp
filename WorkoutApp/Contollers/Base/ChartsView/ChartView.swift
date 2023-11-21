//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class ChartView: BaseView {
    
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()

    func configure(with data: [ChartsView.Data]) {
        layoutIfNeeded()
        addDashLines()
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisSeparator)
        setupView(xAxisSeparator)

    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

private extension ChartView {
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resources.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
    
    func addDashLines(with count: Int? = nil) {
        (0..<9).map { CGFloat($0) }.forEach {
            addDashLine(at: bounds.height / 9 * $0)
        }
    }
}
