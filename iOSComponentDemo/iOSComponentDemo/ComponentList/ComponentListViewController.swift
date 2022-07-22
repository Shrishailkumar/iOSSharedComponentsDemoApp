//
//  ComponentListViewController.swift
//  iOSComponentDemo
//
//  Created by Prajakta Kiran Patil on 15/07/22.
//

import UIKit
enum Components: String {
    case encryptionDecryption = "Encryption/Decryption"
    case barcodeScanner = "Barcode Scanner"
    case geofence = "Geofence"
    case cameraCapture = "Camera Capture"
    case uIUtilityComponent = "UI Utility Component"
    case deviceUtility = "Device Utility"
}

class ComponentListViewController: UIViewController {
    
    // MARK: - Properties
    var componentListArray: NSArray = ["Encryption/Decryption","Barcode Scanner","Geofence","Camera Capture","UI Utility Component","Device Utility"]
    
    // MARK: - UI Components
    @IBOutlet weak var componentListTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        componentListTableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate,UITableViewDataSource
extension ComponentListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ComponentListTableViewCellIdentifier" , for: indexPath) as! ComponentListTableViewCell
        cell.setData(listArray: componentListArray, indexPath: indexPath)
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let title = componentListArray[indexPath.row] as? String else { return }
        
        switch Components(rawValue: title) {
        case .encryptionDecryption:
            let encryptDecryptView = self.storyboard!.instantiateViewController(withIdentifier: "encryptDecryptViewControllerId") as! EncryptDecryptViewController
            self.navigationController?.pushViewController(encryptDecryptView, animated: true)
            
        case.barcodeScanner:
            let encryptDecryptView = self.storyboard!.instantiateViewController(withIdentifier: "barcodeScannerViewControllerId") as! BarcodeScannerViewController
            self.navigationController?.pushViewController(encryptDecryptView, animated: true)
            
        case.deviceUtility:
            let deviceHelper = self.storyboard!.instantiateViewController(withIdentifier: "zDeviceHelperViewController") as! ZDeviceHelperViewController
            self.navigationController?.pushViewController(deviceHelper, animated: true)
            
        default:
            break
        }
        
    }
    
}

