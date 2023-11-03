//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 02.11.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
            
            let circleFrame = UIScreen.main.bounds.width - (16 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(
                arcCenter: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true
            )
            
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = Resources.Colors.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Resources.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * ( 7 / 6 - (8 / 6 * percent))
            let dotPointAngle = CGPoint(x: cos(-dotAngle) * radius + center.x, y: sin(-dotAngle) * radius + center.y)
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPointAngle)
            dotPath.addLine(to: dotPointAngle)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Resources.Colors.active.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = 20
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
            let barsFrame = UIScreen.main.bounds.width - (16 + 40 + 26) * 2
            let barRadius = barsFrame / 2
            let barPath = UIBezierPath(
                arcCenter: center,
                radius: barRadius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true
            )
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            let startBarRadius = barRadius - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + 6
            
            var angle: CGFloat = 7 / 6
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(x: cos(-barAngle) * startBarRadius + center.x, y: sin(-barAngle) * startBarRadius + center.y)
                let endBarPoint = CGPoint(x: cos(-barAngle) * endBarRadius + center.x, y: sin(-barAngle) * endBarRadius + center.y)
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent)) ? Resources.Colors.active.cgColor : Resources.Colors.separator.cgColor
                barLayer.lineWidth = 4
                barLayer.lineCap = .round
                
                barsLayer.addSublayer(barLayer)
                angle -= 1 / 6
            }
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
