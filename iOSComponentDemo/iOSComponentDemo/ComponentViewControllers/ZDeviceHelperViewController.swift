//
//  ZDeviceHelperViewController.swift
//  iOSComponentDemo
//
//  Created by SV59349 on 22/07/22.
//

import UIKit
import ZDeviceHelper

class ZDeviceHelperViewController: UIViewController {
    // MARK: - Properties
    let device = Device.current
    
    // MARK: - UI Components
    @IBOutlet weak var deviceDetailLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Device Utility"
        getDeviceDetails()
    }
    
    func getDeviceDetails()  {
        let deviceDetail = """
    Device : \(device)
    System version : \(device.systemVersion ?? "")
    System name : \(device.systemName ?? "")
    Screen ratio : \(device.screenRatio)
    Chip Set : \(device.getChipName)
    Processor : \(device.getCpuProcessor)
    Battery status : \(device.batteryState!)
    Battery level : \(device.batteryLevel!)
    Telephoto camera : \(device.hasTelephotoCamera == false ? "No" : "Yes")
    Ultra wide camera : \(device.hasUltraWideCamera == false ? "No" : "Yes")
    3d Touch Support) : \(device.has3dTouchSupport == false ? "No" : "Yes")
    Touch ID Support) : \(device.isTouchIDCapable == false ? "No" : "Yes")
    Face ID Support) : \(device.isFaceIDCapable == false ? "No" : "Yes")
    Volume Total Capacity) : \(convertBytesInGB(size: Device.volumeTotalCapacity!))
    Volume available Capacity) : \(convertBytesInGB(size: Device.volumeAvailableCapacity!))
    RAM : \(ZDeviceHelper.ram)
    Host Name : \(ZDeviceHelper.hostName)
    """
        deviceDetailLabel.text = deviceDetail
    }
    
    func convertBytesInGB(size: Int) -> String {
        let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
        return "\(fileSizeWithUnit)"
    }
}
