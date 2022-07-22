//
//  ComponentListTableViewCell.swift
//  iOSComponentDemo
//
//  Created by Kadhirvel on 18/07/22.
//
import UIKit

class ComponentListTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    // MARK: - Initializations
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Data set up in table view cell
    func setData(listArray:NSArray, indexPath:IndexPath){
        let title = listArray[indexPath.row]
        self.titleLabel.text = title as? String
    }
    
}
