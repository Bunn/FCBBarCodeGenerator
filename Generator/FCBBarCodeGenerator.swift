
import Foundation
import UIKit

enum FCBBarcodeType : String {
    case qrcode = "CIQRCodeGenerator"
    case pdf417 = "CIPDF417BarcodeGenerator"
    case code128 = "CICode128BarcodeGenerator"
    case aztec = "CIAztecCodeGenerator"
}


struct FCBBarCodeGenerator {
    
    
    // MARK: Public Methods
    
    func barcodeWithCode(_ code: String, type: FCBBarcodeType, size: CGSize) -> UIImage? {
        if let filter = filterWithCode(code, type: type) {
            return imageWithFilter(filter, size: size)
        }
        
        return nil
    }
    
    
    // MARK: Private Methods
    
    fileprivate func imageWithFilter(_ filter : CIFilter, size: CGSize) -> UIImage? {
        if let image = filter.outputImage {
            
            let scaleX = size.width / image.extent.size.width
            let scaleY = size.height / image.extent.size.height
            let transformedImage = image.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
            
            return UIImage(ciImage: transformedImage)
        }
        return nil
    }
    
    fileprivate func filterWithCode(_ code: String, type: FCBBarcodeType) -> CIFilter? {
        if let filter = CIFilter(name: type.rawValue) {
            guard let data = code.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
            filter.setValue(data, forKey: "inputMessage")
            
            return filter
        }
        return nil
    }
}
