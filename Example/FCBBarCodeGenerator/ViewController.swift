
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageContainer: UIView!
    let codeGenerator = FCBBarCodeGenerator()


    @IBAction func generateButtonTapped() {
        
        if let text = textField.text {
            var type : FCBBarcodeType
            var size : CGSize
            let smallerSide = min(imageContainer.frame.size.width, imageContainer.frame.height)
            
            switch segmentedControl.selectedSegmentIndex {
            case 0 : type = FCBBarcodeType.QRCode
            size = CGSize(width: smallerSide, height: smallerSide)
                
            case 1 : type = FCBBarcodeType.Code128
            size = CGSize(width: imageContainer.frame.width, height: imageContainer.frame.width / 2)
                
            case 2 : type = FCBBarcodeType.PDF417
            size = CGSize(width: imageContainer.frame.width, height: imageContainer.frame.width / 2)
           
            case 3 : type = FCBBarcodeType.Aztec
            size = CGSize(width: smallerSide, height: smallerSide)
                
            default:
                type = FCBBarcodeType.QRCode
                size = CGSize(width: smallerSide, height: smallerSide)
                break
            }
            

            if let image = codeGenerator.barcodeWithCode(text, type: type, size: size) {
                imageView.image = image
            } else {
                imageView.image = nil
            }
        }
    }
}

