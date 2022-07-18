//
//  ComponentListTableViewCell.swift
//  iOSComponentDemo
//
//  Created by Kadhirvel on 18/07/22.
//
import UIKit

class ComponentListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // Data set up in table view cell
    func setData(listArray:NSArray, indexPath:IndexPath){
        let title = listArray[indexPath.row]
        self.titleLabel.text = title as? String
    }
    
}
