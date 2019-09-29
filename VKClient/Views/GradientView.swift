//
//  GradientView.swift
//  VKClient
//
//  Created by mac on 18/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {

    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    
    var GradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    
    //Задаем начальный цвет градиента и конечные цвет
    @IBInspectable var startColor: UIColor = #colorLiteral(red: 0.3204544783, green: 0.5037309527, blue: 0.7235807776, alpha: 1) {
        didSet {
            self.updataColors()
        }
    }
    @IBInspectable var endColor: UIColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) {
        didSet {
            self.updataColors()
        }
    }
    
    //Задаем начало и конец градиента
    @IBInspectable var strartLocation: CGFloat = 0{
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updataColors()
        }
    }
    //Задаем начальную и конечную точки
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updataStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPOint()
        }
    }
    
    
    func updateLocations() {
        self.GradientLayer.locations = [self.strartLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updataColors() {
        self.GradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updataStartPoint() {
        self.GradientLayer.startPoint = startPoint
    }
    func updateEndPOint() {
        self.GradientLayer.endPoint = endPoint
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
}
