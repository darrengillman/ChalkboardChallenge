//
//  UserDetailVCViewModel.swift
//  UserDetailVCViewModel
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

struct userDetailVCViewModel {
   let user: User
   
   var initials: String {
      let firstChar = user.identity.first.first == nil ? "" : String(user.identity.first.first!)
      let secondChar = user.identity.last.first == nil ? "" : String(user.identity.last.first!)
      return "\(firstChar)\(secondChar)"
   }
   
   func configure(_ view: UserDetailVC) {
      view.nameLabel.text = "\(user.identity.first) \(user.identity.last)"
      view.ageLabel.text = "\(user.dob.age) Years Old".capitalized
      view.initialsLabel.text = initials      
   }
}
