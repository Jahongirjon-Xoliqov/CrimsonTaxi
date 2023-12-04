//
//  CircleVView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 28/11/23.
//

import UIKit


class CircleVView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ UIColor.magenta.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = rect
    
        
        textColor = gradientColor(bounds: rect, gradientLayer: gradientLayer)
        
        //super.draw(rect)
//        let context = UIGraphicsGetCurrentContext()
//        context?.clear(rect)
//        
//        context?.setFillColor(UIColor.red.cgColor)
//        context?.fill([rect])
//        
//        context?.setFillColor(UIColor.blue.cgColor)
//        context?.fillEllipse(in: rect)
//        
//        context?.setStrokeColor(UIColor.green.cgColor)
//        context?.setLineWidth(3)
//        context?.strokeEllipse(in: rect)
//        
//        context?.setLineWidth(3)
//        context?.setStrokeColor(UIColor.black.cgColor)
//        context?.strokeLineSegments(between: [
//            CGPoint(x: rect.width/2, y: 0), CGPoint(x: 0, y: rect.height),
//            CGPoint(x: 0, y: rect.height), CGPoint(x: rect.width, y: rect.height),
//            CGPoint(x: rect.width, y: rect.height), CGPoint(x: rect.width/2, y: 0)
//        ])
//        
//        context?.setLineWidth(3)
//        context?.setStrokeColor(UIColor.darkGray.cgColor)
//        let bezierStart: CGPoint = CGPoint(x: 20, y: 260)
//        let bezierEnd: CGPoint = CGPoint(x: 300, y:  260)
//        let bezierHelper1: CGPoint = CGPoint(x: 80,  y: 320)
//        let bezierHelper2: CGPoint = CGPoint(x: 240, y:  320)
//        
//        context?.beginPath()
//        context?.move(to: bezierStart)
//        context?.addCurve(to: bezierEnd, control1: bezierHelper1, control2: bezierHelper2)
//        context?.strokePath()
//        
//        let text = "Perfect"
//        var font = UIFont.systemFont(ofSize: 20)
//        var fontName = font.fontName as NSString
//        var cgFont = CGFont(fontName)
//        var copiedFont = cgFont!.copy(withVariations: nil)
//        
//        context?.setFont(copiedFont!)
//        context?.setTextDrawingMode(.fill)
//        context?.
        
//        let renderer = UIGraphicsImageRenderer(size: rect.size)
//        let img = renderer.image { ctx in
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.alignment = .center
//
//            let attrs = [
//                            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 36)!,
//                            NSAttributedString.Key.paragraphStyle: paragraphStyle,
//                            NSAttributedString.Key.foregroundColor: UIColor.black
//                        ]
//
//            let string = "How much wood would a woodchuck\nchuck if a woodchuck would chuck wood?"
//            string.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
//        }
        
    }
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
    //We are creating UIImage to get gradient color.
          UIGraphicsBeginImageContext(bounds.size)
          gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
          let image = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          return UIColor(patternImage: image!)
    }
}


class LetterDrawingView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Get the context to draw into
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Set up drawing attributes
        context.setFillColor(UIColor.black.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2.0)
        
        // Set the font and size using Core Text
        let fontSize: CGFloat = 50.0
        let fontName = "Helvetica" // Change this to your desired font
        guard let cgFont = CGFont(fontName as CFString) else { return }
        
        // Text to be drawn
        let textToDraw = "HELLO"
        
        // Calculate text size and position
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
        ]
        let textSize = (textToDraw as NSString).size(withAttributes: textAttributes)
        let xPosition = (bounds.size.width - textSize.width) / 2.0
        let yPosition = (bounds.size.height - textSize.height) / 2.0
        
        // Set the font in the context
        context.setFont(cgFont)
        
        // Draw the text
        (textToDraw as NSString).draw(at: CGPoint(x: xPosition, y: yPosition), withAttributes: textAttributes)
    }
}
