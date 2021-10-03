//
//  MainVCViewModel.swift
//  MainVCViewModel
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation
import UIKit

struct MainVCViewModel {
   
   enum Section: Hashable {
      case main
   }
   
   // implement User as an enum to allow tableview diffable datasource to handle different data scenarios
   enum UserModel: Equatable, Hashable {
      case noUser
      case user(User)
      
      var user: User? {
         switch self {
            case .noUser: return nil
            case .user(let user): return user
         }
      }
   }
   
   
   let dataSource: DataSource
   
   var users : [UserModel] {
      ///  `didSet` to support writing downloaded data back to data source - use if time to provide data caching, load at startup, and a "refresh" from API capability
      didSet {
         dataSource.replaceUsers(with: users.compactMap{$0.user})
      }
   }
   
   
   init(with dataSource: DataSource) {
      self.dataSource = dataSource
      let importedUsers = dataSource.getUsers()
      users =  importedUsers.isEmpty ?  [.noUser] : importedUsers.sorted{$0.dob.age < $1.dob.age}.map{.user($0)}
      //TODO: sort by dob not age.
   }

   
   func configure(_ view: MainVC) {
      view.title = Strings.mainVCTitle
      //TODO: implement other appearance settings - common colour theme etc.
   }
}
