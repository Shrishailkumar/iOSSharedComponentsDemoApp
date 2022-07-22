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




# ZDeviceHelper.swift

In your podfile include: pod 'ZDeviceHelper', :git => 'https://github.com/shekharvishwazensar/ZDeviceHelper'

# Usage
     let device = Device.current

        
        print(device) // eg :- "iPhone 11 Pro"
        print(device.systemVersion) //Print system version (15.0)
        print(device.systemName)  //Print system name (iOS)
        print(device.width) //Print device width                
        print(device.height) //Print device height
        print(device.screenRatio) //Print device screen ratio (16:9)
        print(device.isZoomed) //Print true or false
        print(device.batteryState) //Get current battery state
        print(device.batteryLevel) //Get current battery level
        print(device.hasCamera) //Return device has camera has camera
        print(device.hasTelephotoCamera) //Return device has camera has camera
        print(device.hasUltraWideCamera) //Return device has camera has camera
        print(device.has3dTouchSupport)  //Return device is capable of 3d Touch
        print(device.isTouchIDCapable) //Return device is capable of TouchId
        print(device.isFaceIDCapable) //Return device is capable of faceId
        print(Device.volumeTotalCapacity!) //Return device volume TotalCapacity in bytes
        print(Device.volumeAvailableCapacity!) //Return device volume AvailableCapacity in bytes
        print(device.getChipName) //Return current device chip name
        print(device.getCpuProcessor) //Return current device processor
        print(ZDeviceHelper.ram) //Return current device RAM
        print(ZDeviceHelper.hostName) //Return current device hostName

Check the Device You're Running On    

     if device == .iPhone11ProMax {
        // Do something
     } else {
         // Do something else
     }

Check the Device battery State 

     if device.batteryState == .full || device.batteryState >= .charging(75) {
         print("Your battery is full!")
     }

Check the Device battery level 

     if device.batteryLevel >= 50 {
        // Do something
     } else {
         showError()
     }

Get the Device Family    

    if device.isPod {
        // iPods (real or simulator)
    } else if device.isPhone {
        // iPhone (real or simulator)
    } else if device.isPad {
        // iPad (real or simulator)
    }   

    if device.isSimulator {
        //Skip doing something (iPod/iPhone/iPad)
    }

Check Screen Brightness

    if device.screenBrightness > 50 {
        print("Take care of your eyes!")
    }