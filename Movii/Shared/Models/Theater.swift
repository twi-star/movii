//
//  Theater.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import CoreLocation

struct Theater
{
    // MARK: - Seeder 
    
    private let name: String
    private let address: String
    private let location: CLLocation
    lazy internal var movies: [Movie] = { [Movie]() }()
    
    //MARK: - Constructor
    
    internal init(name: String, address: String, location: CLLocation) {
        self.name   = name
        self.location = location
        self.address = address
    }
}