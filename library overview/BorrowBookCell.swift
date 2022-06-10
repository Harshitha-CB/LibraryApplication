//
//  BorrowBookCell.swift
//  library overview
//
//  Created by cdp on 14/05/22.
//

import UIKit

class BorrowBookCell: UITableViewCell {

    //create outlets for labels
    @IBOutlet weak var returnDateL: UILabel!
    @IBOutlet weak var borrowDateL: UILabel!
    @IBOutlet weak var bookName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
