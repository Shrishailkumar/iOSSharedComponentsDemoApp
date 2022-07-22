# iOSSharedComponentsDemoApp
Demo App for demonstrating the iOSAppServiceComponents

# BarCode scanner module
We have worked on reusable barcode scanner module which will help in scanning almost everything.
How to integrate this module:
Please follow these steps to successfully integrate this using POD.

1. In your podfile include: pod 'ZQRScannerLib', :git => 'https://github.com/nagmanisinghzensar/ZenScanner'
2. In the target info.plist give description for Privacy-Camera usage, else your app will not run.
3. In the viewcontroller include import ZQRScannerLib
4. Take a view and subclass it with ZQRScannerView
5. Implement a function setupQRScannerView() in the viewcontroller
        private func setupQRScannerView() {
            zqrScannerView.configure(delegate: self, input: .init(isBlurEffectEnabled: true))
            zqrScannerView.startRunning()
        }
6. Implement the delegate function as below
        extension BarcodeScannerViewController: ZQRScannerViewDelegate {
            func qrScannerView(_ qrScannerView: ZQRScannerView, didFailure error: ZQRScannerError) {
                print(error.localizedDescription)
            }

            func qrScannerView(_ qrScannerView: ZQRScannerView, didSuccess code: String) {
                if let url = URL(string: code), (url.scheme == "http" || url.scheme == "https") {
                    // Do your stuff
                } else {
                    showAlert(code: code)
                }
            }
        }
        
7. When your viewcontroller disappears then call:
        zqrScannerView.stopRunning()
     
        
# CRYPTOGRAPHICAL OPERATIONS
We have worked on reusable cryptographical opertaions which are listed below,
1. Encyrption/Decryption
2. Hashing
3. Authenticating 

Please follow these steps to successfully integrate this using POD.

1. In your podfile include: pod 'iOSEncryptDecryptLib', :git => 'https://github.com/PrajaktaZensar/iOSEncryptDecrypt'
2. In the viewcontroller include import iOSEncryptDecryptLib.
3. Create object and initilized the class CryptoKitClass in the view controller.
4. Call AESencryptFunc() in view the controller for encryption.
        classObject.encryptFunc(passowrdString: yourString)
5. Call AESencryptFunc() in view the controller for decryption.
6. Call hashHmacSHA512CryptoKit() in view the controller for authentication.
7. Call hashSha512CryptoKit() in view the controller for hashing.




