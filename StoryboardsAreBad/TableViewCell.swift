//
//  TableViewCell.swift
//  StoryboardsAreBad
//
//  Created by Jeremy Petter on 2016-10-20.
//  Copyright © 2016 Jeremy Petter. All rights reserved.
//

import UIKit

let TableViewCellReuseIdentifier = "TableViewCellReuseIdentifier"

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    func setUp() {
        backgroundColor = .green
        // contentView.addSubview(<#T##view: UIView##UIView#>)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
