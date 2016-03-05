
import Foundation
import UIKit

enum FCBBarcodeType : String {
    case QRCode = "CIQRCodeGenerator"
    case PDF417 = "CIPDF417BarcodeGenerator"
    case Code128 = "CICode128BarcodeGenerator"
    case Aztec = "CIAztecCodeGenerator"
}


struct FCBBarCodeGenerator {
    
    
    // MARK: Public Methods
    
    func barcodeWithCode(code: String, type: FCBBarcodeType, size: CGSize) -> UIImage? {
        if let filter = filterWithCode(code, type: type) {
            return imageWithFilter(filter, size: size)
        }
        
        return nil
    }
    
    
    // MARK: Private Methods
    
    private func imageWithFilter(filter : CIFilter, size: CGSize) -> UIImage? {
        if let image = filter.outputImage {
            
            let scaleX = size.width / image.extent.size.width
            let scaleY = size.height / image.extent.size.height
            let transformedImage = image.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
            
            return UIImage(CIImage: transformedImage)
        }
        return nil
    }
    
    private func filterWithCode(code: String, type: FCBBarcodeType) -> CIFilter? {
        if let filter = CIFilter(name: type.rawValue) {
            let data = code.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
            filter.setValue(data, forKey: "inputMessage")
            
            return filter
        }
        return nil
    }
}