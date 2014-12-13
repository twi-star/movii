//
//  ViewController.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Setup
    func setupViews()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Movii"
    }
}

