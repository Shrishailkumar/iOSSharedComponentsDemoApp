//
//  EncryptDecryptDemoViewController.swift
//  iOSComponentDemo
//
//  Created by Prajakta Kiran Patil on 17/07/22.
//

import UIKit



class EncryptDecryptDemoViewController: UIViewController {
    
    
    @IBOutlet weak var changeLbl: UILabel!
    @IBOutlet weak var decryptionBtn: UIButton!
    @IBOutlet weak var encryptionBtn: UIButton!
    @IBOutlet weak var passowrdTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        encryptionBtn.setTitle("Encrypt Text", for: .normal)
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func encryptionBtnAction(_ sender: Any) {
        
        
        if !(passowrdTextField.isEmpty) {
            encryptionBtn.setTitle("Show encrypted text", for: .normal)
            
        } else {
            
            
            
        }
        
    }
    
    
    
    @IBAction func decryptionBtnAction(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}


