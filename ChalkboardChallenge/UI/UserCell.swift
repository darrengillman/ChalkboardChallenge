//
//  UserCell.swift
//  UserCell
//
//  Created by Darren Gillman on 03/10/2021.
//

import UIKit

class UserCell: UITableViewCell {
   static let cellID = "UserCell"
   
   let nameLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
      return label
   }()
   
   let dateLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
      return label
   }()
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
      contentView.addForAutoLayout(nameLabel, dateLabel)
      NSLayoutConstraint.activate([
         nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
         
         dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
         dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
         dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80)

      ])
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func configure(with user: User){
      nameLabel.text = user.identity.fullName
      dateLabel.text = user.dob.birthday
   }

}
