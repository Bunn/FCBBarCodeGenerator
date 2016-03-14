# FCBBarCodeGenerator
Simple BarCode Generator written in Swift

## Installation
Just drag `FCBBarCodeGenerator.swift` to your project.

## How to use
```swift
let size = CGSize(width: 100, height: 100)
let code = "My Code"
let type = FCBBarcodeType.QRCode

if let image = codeGenerator.barcodeWithCode(code, type: type, size: size) {
	imageView.image = image
} else {
	imageView.image = nil
}
```

## Screenshots
![QRCode](/Screenshots/screenshot.png?raw=true "QRCode")

## License
FCBBarCodeGenerator is released under the MIT license. See the LICENSE file for more info.
