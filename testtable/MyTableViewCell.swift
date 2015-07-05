//
//  MyTableViewCell.swift
//  testtable
//
//  Created by jonathan twaddell on 7/4/15.
//  Copyright (c) 2015 Trestles. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  @IBOutlet var headerLabel: UILabel!
  @IBOutlet var detailLabel: UILabel!
  @IBOutlet var priceLabel: UILabel!

  func setHeader(header: String){
    self.headerLabel.text = header
    self.headerLabel.layer.borderColor = UIColor.greenColor().CGColor
    self.headerLabel.layer.borderWidth = 2.0
  }

  func setDetail(detail: String){
    self.detailLabel.text = detail
    self.detailLabel.layer.borderColor = UIColor.blueColor().CGColor
    self.detailLabel.layer.borderWidth = 1.0
  }

  
  func setPrice(price: String)
  {
    println("here is the price \(price)")
    self.priceLabel.text = price
    self.priceLabel.layer.borderColor = UIColor.orangeColor().CGColor
    self.priceLabel.layer.borderWidth = 1.0
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    println("within layoutSubviews in cell")
    self.headerLabel.preferredMaxLayoutWidth = self.headerLabel.frame.size.width
    self.detailLabel.preferredMaxLayoutWidth = self.detailLabel.frame.size.width

  }

}
