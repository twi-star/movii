//
//  ViewController.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    private let redboothLocation: CLLocation = {
        var location: CLLocation = CLLocation(latitude: Double(41.401749), longitude: Double(2.152119))
        return location
    }()
    private let chinaLocation: CLLocation = {
        var location: CLLocation = CLLocation(latitude: Double(35.861660), longitude: Double(104.195397))
        return location
        }()
    
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
    
    //MARK: - Actions
    
    @IBAction func fakeChinaLocation(sender: AnyObject)
    {
        Billboarder.reportBillBoardInLocation(chinaLocation)
    }
    
    @IBAction func fakeRedboothLocation(sender: AnyObject)
    {
        Billboarder.reportBillBoardInLocation(redboothLocation)
    }
}

