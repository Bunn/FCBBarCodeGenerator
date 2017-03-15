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
    
    func barcode(code: String, type: FCBBarcodeType, size: CGSize) -> UIImage? {
        if let filter = filter(code: code, type: type) {
            return image(filter: filter, size: size)
        }
        
        return nil
    }
    
    
    // MARK: Private Methods
    
    fileprivate func image(filter : CIFilter, size: CGSize) -> UIImage? {
        if let image = filter.outputImage {
            
            let scaleX = size.width / image.extent.size.width
            let scaleY = size.height / image.extent.size.height
            let transformedImage = image.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
            
            return UIImage(ciImage: transformedImage)
        }
        return nil
    }
    
    fileprivate func filter(code: String, type: FCBBarcodeType) -> CIFilter? {
        if let filter = CIFilter(name: type.rawValue) {
            guard let data = code.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
            filter.setValue(data, forKey: "inputMessage")
            
            return filter
        }
        return nil
    }
}
