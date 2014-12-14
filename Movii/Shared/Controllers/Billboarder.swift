//
//  Billboarder.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import CoreLocation

class Billboarder
{
    
    //MARK: Theater checker
    
    class func reportBillBoardInLocation(location: CLLocation)
    {
        let theater: Theater? = FakeAPIClient.getInstance().getNearTheater(location)
        if (theater == nil) { return }
        notifyWatch(theater: theater!)
    }
    
    //MARK: WatchKit communication
    
    class func notifyWatch(#theater: Theater) {
        // Not available for the demo
        // 1. It would generate a notification with the movies available and the information of the theater
        // Note: Comunication between the device and the watch is not possible on the direction Device -> Watch
        UIAlertView(title: "Near theater", message: "We've found a theater next to you: \(theater.name) \n\n NOTIFYING WATCH", delegate: nil, cancelButtonTitle: "Cancel").show()
    }
}
