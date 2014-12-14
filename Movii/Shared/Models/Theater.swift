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
    
    internal let name: String
    internal let address: String
    internal let location: CLLocation
    lazy internal var movies: [Movie] = { [Movie]() }()
    
    //MARK: - Constructor
    
    internal init(name: String, address: String, location: CLLocation) {
        self.name   = name
        self.location = location
        self.address = address
    }
    
    //MARK: - Custm getters
    
    mutating internal func theaterName() -> String
    {
        return self.name
    }
    
    mutating internal func moviesCount() -> Int
    {
        return self.movies.count
    }
    
    //MARK: - Helpers
    
    func distance(fromLocation location: CLLocation) -> Double
    {
        return location.distanceFromLocation(self.location)
    }
}