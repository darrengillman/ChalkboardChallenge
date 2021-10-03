//
//  UserDetailVC.swift
//  UserDetailVC
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation
import UIKit

class UserDetailVC : UIViewController {
   
   var viewModel: userDetailVCViewModel!

   let initialsLabel = UILabel()
   
   let nameLabel: UILabel = {
      let label = UILabel()
      label.textAlignment = .center
      label.font = .systemFont(ofSize: 30, weight: .bold)
      return label
   }()
   
   let ageLabel: UILabel = {
      let label = UILabel()
      label.textAlignment = .center
      label.font = .systemFont(ofSize: 18, weight: .semibold)
      return label
   }()
   
   let backButton: UIButton = {
      let button = UIButton()
      button.setTitle(Strings.backButtonTitle, for: .normal)
      button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
      button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
      button.backgroundColor = .black
      button.setTitleColor(.white, for: .normal)
      button.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      return button
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupStackview()
   }
   
   
   private func setupStackview() {
      viewModel.configure(self)
      let initialsView = makeCircleView(with: initialsLabel, fontSize: 40)
      view.addForAutoLayout(initialsView)
      let hStack = UIStackView(arrangedSubviews: [initialsView, nameLabel, ageLabel, backButton])
      view.addForAutoLayout(hStack)
      hStack.axis = .vertical
      hStack.spacing = 20.0
      hStack.alignment = .fill
      NSLayoutConstraint.activate([
         hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
         hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
         hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
         hStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
      ])

   }
   
   
   private func makeCircleView(with label: UILabel, fontSize: CGFloat) -> UIView {
      let inset: CGFloat = fontSize > 20 ? 24 : 12  //crude method!  Work out actual size if time.
      label.font = UIFont.boldSystemFont(ofSize: fontSize)
      label.textColor = .white
      label.sizeToFit()
      let circView = UIView()
      circView.addForAutoLayout(label)
      circView.layer.cornerRadius = label.bounds.width / 2 + inset
      circView.backgroundColor = .black
      let containerView = UIView()
      containerView.backgroundColor = .white
      containerView.addForAutoLayout(circView)
      NSLayoutConstraint.activate([
         label.leadingAnchor.constraint(equalTo: circView.leadingAnchor, constant: inset),
         label.trailingAnchor.constraint(equalTo: circView.trailingAnchor, constant: -inset),
         label.centerYAnchor.constraint(equalTo: circView.centerYAnchor),
         circView.heightAnchor.constraint(equalTo: circView.widthAnchor, multiplier: 1),
         circView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
         circView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
         circView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
         circView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
      ])
      return containerView
   }
   
   @objc func backTapped() {
      dismiss(animated: true, completion: nil)
   }
   
   
   
}
