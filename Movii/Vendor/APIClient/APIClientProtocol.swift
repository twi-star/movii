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
    func getNearTheater(location: CLLocation) -> Theater?
    func getMovieInfo(identifier: String) -> Movie?
}