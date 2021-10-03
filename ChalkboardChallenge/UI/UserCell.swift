//
//  UserCell.swift
//  UserCell
//
//  Created by Darren Gillman on 03/10/2021.
//

import UIKit

class UserCell: UITableViewCell {
   static let cellID = "UserCell"
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

}
