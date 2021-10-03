//
//  ViewController.swift
//  ChalkboardChallenge
//
//  Created by Darren Gillman on 03/10/2021.
//

import UIKit

class MainVC: UIViewController {
   
   var viewModel: MainVCViewModel!
   
   let tv = UITableView()
   var dataSource:  UITableViewDiffableDataSource<MainVCViewModel.Section, MainVCViewModel.UserModel>!


   override func viewDidLoad() {
      super.viewDidLoad()
      setupTableview()
      dataSource = makeDataSource()
      applySnapshot(animatingDifferences: false)
      viewModel.configure(self)
   }
   
   
   private func setupTableview() {
      view.addForAutoLayout(tv, andPinWithInset: 0)
      tv.delegate = self
      tv.backgroundColor = view.backgroundColor
      tv.register(UserCell.self, forCellReuseIdentifier: UserCell.cellID)
      tv.register(NoDataCell.self, forCellReuseIdentifier: NoDataCell.cellID)
   }

   

}

//MARK:- TableView methods; delegate and diffable data source
extension MainVC: UITableViewDelegate {
   
   private func makeDataSource() -> UITableViewDiffableDataSource<MainVCViewModel.Section, MainVCViewModel.UserModel> {
      let ds = UITableViewDiffableDataSource<MainVCViewModel.Section, MainVCViewModel.UserModel> (tableView: tv, cellProvider: {
         (tableView: UITableView, indexPath: IndexPath, userModel: MainVCViewModel.UserModel) -> UITableViewCell? in
         switch userModel {
            case .noUser:
               let cell =  tableView.dequeueReusableCell(withIdentifier: NoDataCell.cellID, for: indexPath) as! NoDataCell
               return cell
            case .user(let user):
               let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellID, for: indexPath) as! UserCell
               cell.textLabel?.text = "\(user.identity.title) \(user.identity.first) \(user.identity.last)"
               return cell
         }
      })
      return ds
   }
   
   private func applySnapshot(animatingDifferences: Bool) {
      var snapShot = NSDiffableDataSourceSnapshot<MainVCViewModel.Section, MainVCViewModel.UserModel>()
      snapShot.appendSections([.main])
      snapShot.appendItems(viewModel.users, toSection: .main)
      dataSource.apply(snapShot, animatingDifferences: animatingDifferences)
   }

   
}

