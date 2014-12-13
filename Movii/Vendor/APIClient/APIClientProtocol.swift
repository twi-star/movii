//
//  APIClientProtocol.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import CoreLocation

protocol APIClientProtocol
{
    class func getTheaters(location: CLLocation) -> [Theater]
    class func getMovieInfo(identifier: String) -> Movie?
}