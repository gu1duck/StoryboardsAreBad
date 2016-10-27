//
//  ViewController.swift
//  StoryboardsAreBad
//
//  Created by Jeremy Petter on 2016-10-20.
//  Copyright © 2016 Jeremy Petter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.title = "YOLO"

        customView.button1.addTarget(self, action: #selector(navigateToView), for: .touchUpInside)

        customView.button2.addTarget(self, action: #selector(navigateToTable), for: .touchUpInside)

    }

    func navigateToView(sender: UIButton) {
        let targetViewController = ViewController()
        navigationController?.pushViewController(targetViewController, animated: true)
    }

    func navigateToTable(sender: UIButton) {
        let targetViewController = TableViewController()
        navigationController?.pushViewController(targetViewController, animated: true)
//        present(
//            targetViewController,
//            animated: true,
//            completion: nil
//        )
    }



    lazy var customView: CustomView = {
        return CustomView()
    }()

}

