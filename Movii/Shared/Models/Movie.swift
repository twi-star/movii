//
//  Movie.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import UIKit


struct Session
{
    let extra: String?
    let time: String
    
    init(time: String, extra: String?)
    {
        self.extra = extra
        self.time = time
    }
}

struct Movie
{
    internal let identifier: String
    private let name: String
    private let poster: UIImage
    private let sinopsis: String
    private let category: String
    private let rating: UInt
    private let buyLink: String
    lazy var sessions: [Session] = { [Session]() }()
    
    init(identifier: String, name: String, poster: UIImage, sinopsis: String, category: String, rating: UInt, buyLink: String)
    {
        self.identifier = identifier
        self.name = name
        self.poster = poster
        self.sinopsis = sinopsis
        self.category = category
        self.rating = rating
        self.buyLink = buyLink
    }
}