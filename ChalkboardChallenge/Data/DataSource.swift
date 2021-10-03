//
//  DataSource.swift
//  DataSource
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

class DataSource {
   private var users: [User] = []

   func getUsers() -> [User] {
      
//      //TODO: delete test data loader when downloading built!
//      
//      users = (try? JSONDecoder().decode(Results.self, from: Data(TestData.json.utf8)).results) ?? []
//       
//      // end of dummy data
      
      
      return users
   }
   
   func replaceUsers(with users: [User]) {
      self.users = users
   }
}
