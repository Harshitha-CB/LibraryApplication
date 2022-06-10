//
//  BookListCell.swift
//  library overview
//
//  Created by cdp on 12/05/22.
//

import UIKit

class BookListCell: UITableViewCell {
//create outlets for labels
    @IBOutlet weak var authorNameL: UILabel!
    @IBOutlet weak var bookNameL: UILabel!
    @IBOutlet weak var publicationDateL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
