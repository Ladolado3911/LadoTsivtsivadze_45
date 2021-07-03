//
//  ContentCell.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class ContentCell: UITableViewCell {
    
 
    @IBOutlet weak var content: UILabel!
    
    var content2: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let content2 = content2 else { return }
        //print("testing guard let")
        content.text = content2
    }
    
    func configCell(content text: String) {
        //print("here")
        content.text = text
    }
}
