//
//  InterfaceController.swift
//  Movii WatchKit Extension
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    lazy var posterImageView: WKInterfaceImage = { WKInterfaceImage() }()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
                
        
        // Configure interface objects here.
        NSLog("%@ awakeWithContext", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

}
