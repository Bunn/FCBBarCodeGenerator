
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
            case 0 : type = .qrcode
            size = CGSize(width: smallerSide, height: smallerSide)
                
            case 1 : type = .code128
            size = CGSize(width: imageContainer.frame.width, height: imageContainer.frame.width / 2)
                
            case 2 : type = .pdf417
            size = CGSize(width: imageContainer.frame.width, height: imageContainer.frame.width / 2)
           
            case 3 : type = .aztec
            size = CGSize(width: smallerSide, height: smallerSide)
                
            default:
                type = .qrcode
                size = CGSize(width: smallerSide, height: smallerSide)
                break
            }
            

            if let image = codeGenerator.barcode(code: text, type: type, size: size) {
                imageView.image = image
            } else {
                imageView.image = nil
            }
        }
    }
}

