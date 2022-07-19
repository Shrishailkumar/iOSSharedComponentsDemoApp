//
//  EncryptDecryptViewController.swift
//  iOSComponentDemo
//
//  Created by Prajakta Kiran Patil on 18/07/22.
//

import UIKit
import iOSEncryptDecryptLib

class EncryptDecryptViewController: UIViewController {

    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var authenticateBtn: UIButton!
    @IBOutlet weak var hashBtn: UIButton!
    @IBOutlet weak var encryptBtn: UIButton!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var decryptBtn: UIButton!
    let classObj = CryptoKitClass(passowrdString: "passowrd")
    var encryptedStr : String!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        statusLbl.isHidden = true
        
        decryptBtn.isHidden = true
        hashBtn.isHidden = true
        authenticateBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func authenticateBtnAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Authenticated Password", message: classObj.hashHmacSHA512CryptoKit(), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    @IBAction func hashFuncAction(_ sender: Any) {
        let alert = UIAlertController(title: "Hash Password", message:  classObj.hashSha512CryptoKit(), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
        
        
    }
    
    @IBAction func decryptBtnAction(_ sender: Any) {
        
        let decryptStr = classObj.decryptFunc()
//        passwordtextField.isSecureTextEntry = false
//        passwordtextField.text = decryptStr
        
        let alert = UIAlertController(title: "Decrypted Password", message: decryptStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func callAlert() {
        
        let alert = UIAlertController(title: "Your Encrypted Password", message: encryptedStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func encryptBtnAction(_ sender: Any) {
        
        if (passwordtextField.text?.isEmpty ?? true) && encryptBtn.titleLabel?.text == "Send" {
          
            let alert = UIAlertController(title: "Alert", message: "Please enter password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        } else {
            
            if encryptBtn.titleLabel?.text == "Send" {
                decryptBtn.isHidden = false
                hashBtn.isHidden = false
                authenticateBtn.isHidden = false
                encryptBtn.setTitle("Check Encrypted Password", for: .normal)
                callEncryptionFunc()
            } else {
                callAlert()
            }
        }
    }
    
    func callEncryptionFunc()
    {
        
        do {
            encryptedStr = try classObj.encryptFunc(passowrdString: passwordtextField.text ?? "")
        } catch {

        }
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
