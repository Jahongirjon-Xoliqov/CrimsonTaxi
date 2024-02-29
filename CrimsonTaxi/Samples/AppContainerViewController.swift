//
//  AppContainerViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 28/12/23.
//

import UIKit
import ImageIO

extension UIImage {
    class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        let frameCount = CGImageSourceGetCount(source)
        var images: [UIImage] = []
        
        for i in 0..<frameCount {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let image = UIImage(cgImage: cgImage)
                images.append(image)
            }
        }
        
        return UIImage.animatedImage(with: images, duration: 0.0)
    }
}

class AppContainerViewController: UIViewController {
    
    @IBOutlet weak var label: AttributedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //open func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key : Any]
        
        label.numberOfLines = 0
        //label.attributedText = attr
        label.backgroundColor = .systemGray6
        
        let text = """
        Lorem massa quis tincidunt
        neque risus in
        lectNq
        """
        
        let attr = Attr(text: text,
                        color: .black,
                        font: .MONTSERRAT_REGULAR,
                        size: 50)
        
//        let attr1 = Attr(text: "Maecenas",
//                         color: .red,
//                         font: .MONTSERRAT_REGULAR,
//                         size: 20)
        
        let attr2 = Attr(text: "quis",
                         color: .orange,
                         font: .MONTSERRAT_BOLD,
                         size: 50)
        label.set(attribute: attr)
        //label.append(attribute: attr1)
        label.replace(in: "quis", with: attr2)
        
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "giphy", withExtension: "gif")!)
        
        let imageView = UIImageView(image: UIImage.gifImageWithData(imageData!) ?? .cancelLarge)
        imageView.frame = CGRect(origin: CGPoint(x: 200, y: 300), size: CGSize(width: 200, height: 200))
        view.addSubview(imageView)
        
        label.append(image: .cancelLarge, color: .blue, size: CGSize(width: 60, height: 60), attachTo: .imageCenterToFontCenter)
        label.tintColor = .red
        
//        label.adjustsFontForContentSizeCategory = true
//        label.adjustsFontSizeToFitWidth = true
        
//        let html = """
//        <!DOCTYPE html>
//        <html lang="ru">
//        <head>
//          <meta charset="UTF-8">
//          <title>Пример с картинкой и 100 буквами</title>
//        </head>
//        <body>
//          <h1>Пример с картинкой и 100 буквами</h1>
//          <p>
//            Это пример HTML-кода, который содержит картинку и 100 букв.
//            <img src="https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=" width="15" height="15" alt="Пример изображения" width="100" height="100">
//            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet pretium lectus.
//            Nullam vitae elit libero, a pharetra augue. Maecenas vehicula,
//            massa ac ultricies tincidunt, risus leo tincidunt massa,
//            quis tincidunt neque risus in lectus.
//          </p>
//        </body>
//        </html>
//        """
//        let data = html.data(using: .utf8)
//        label.attributedText = try! NSAttributedString(data: data!, documentAttributes: nil)
        
        /*
        label.set(attr: NSAttributedString)
             .append(attr: NSAttributedString)
             .replace(attr: NSAttributedString, in range: NSRange)
             .append(image: NSTextAttachment, to location: Int, size: CGSize, padding: UIEdgeInsets)
        */
        
        
        
    }
    

}





/*
 view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openResultController)))
 @objc private func openResultController() {
     
     let action = TransactionAction(title: "",
                                    icon: "",
                                    action: subaction1)
     let result = TransferResultAction(icon: "",
                                       status: "",
                                       subactions: [action])
     
     let vc = ResultStatusViewController(with: result)
     present(vc, animated: true)
     
 }
 
 private func subaction1() {
     print("worked")
 }
 */
