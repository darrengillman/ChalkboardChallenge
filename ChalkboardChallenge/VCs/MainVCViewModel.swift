//
//  MainVCViewModel.swift
//  MainVCViewModel
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

struct MainVCViewModel {
   let dataSource: DataSource
   
   init(with dataSource: DataSource) {
      self.dataSource = dataSource
   }
}
