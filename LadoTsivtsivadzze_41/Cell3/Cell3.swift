//
//  Cell3.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class Cell3: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    var title2: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let title2 = title2 else { return }
        title.text = title2
        
        
    }
    
}
