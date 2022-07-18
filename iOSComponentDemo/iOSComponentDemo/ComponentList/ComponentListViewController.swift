//
//  ComponentListViewController.swift
//  iOSComponentDemo
//
//  Created by Prajakta Kiran Patil on 15/07/22.
//

import UIKit
enum APICountry : String{
    case EncryptionDecryption = "Encryption/Decryption"
    case BarcodeScanner = "Barcode Scanner"
    case Geofence = "Geofence"
    case CameraCapture = "Camera Capture"
    case UIUtilityComponent = "UI Utility Component"
}

class ComponentListViewController: UIViewController {
    
    @IBOutlet weak var componentListTableView: UITableView!

    var componentListArray: NSArray = ["Encryption/Decryption","Barcode Scanner","Geofence","Camera Capture","UI Utility Component"]

    override func viewDidLoad() {
        super.viewDidLoad()
        componentListTableView.reloadData()
        // Do any additional setup after loading the view.
    }


}

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    
    
   
}

