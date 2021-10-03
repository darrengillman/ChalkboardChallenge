//
//  NoDataCell.swift
//  NoDataCell
//
//  Created by Darren Gillman on 03/10/2021.
//

import UIKit

class NoDataCell: UITableViewCell {
   static let cellID = "NoDataCell"
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      textLabel?.textColor = .systemOrange
      textLabel?.textAlignment = .center
      textLabel?.text = "No Users.  Click here to Download"
      textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

}
