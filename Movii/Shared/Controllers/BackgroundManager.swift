//
//  BackgroundManager.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import UIKit

class BackgroundManager
{
    class func executeIfBackground(synchronousFunction: () -> ()) {
        if (UIApplication.sharedApplication().applicationState == UIApplicationState.Background) {
            
            let taskID = beginBackgroundUpdateTask()
            synchronousFunction()
            endBackgroundUpdateTask(taskID)
        }
    }
    
    class func beginBackgroundUpdateTask() -> UIBackgroundTaskIdentifier {
        return UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({})
    }
    
    class func endBackgroundUpdateTask(taskID: UIBackgroundTaskIdentifier) {
        UIApplication.sharedApplication().endBackgroundTask(taskID)
    }
}