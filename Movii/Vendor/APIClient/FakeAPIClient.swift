//
//  FakeAPIClient.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import Foundation
import CoreLocation

class FakeAPIClient
{
    //MARK: - Attributes
    
    internal lazy var movies: [Movie] = { [Movie]() }()
    internal lazy var theaters: [Theater] = { [Theater]() }()
    private let jsonName: String

    
    //MARK: - Singleton
    
    private struct Singleton {
        static var instance: FakeAPIClient?
    }
    
    class func getInstance() -> FakeAPIClient
    {
        if (Singleton.instance == nil) {
            Singleton.instance = FakeAPIClient(bundleJSONName: "billboard.json")
        }
        return Singleton.instance!
    }
    
    
    //MARK: - Constructors
    
    init(bundleJSONName: String) {
        self.jsonName = bundleJSONName
        seedData()
    }
    
    
    //MARK: - Helpers
    
    func seedData()
    {
        let filePath: String = NSBundle.mainBundle().pathForAuxiliaryExecutable(self.jsonName)!
        let data: NSData = NSData(contentsOfFile: filePath)!
        let json = JSON(data: data)
        let theaters = json["theaters"]
        let movies = json["movies"]
        
        // Movies
        for (index: String, subJson: JSON) in movies {
            var identifier: Int = subJson["identifier"].intValue
            var name: String = subJson["name"].stringValue
            var poster: String = subJson["poster"].stringValue
            var sinopsis: String = subJson["sinopsis"].stringValue
            var category: String = subJson["category"].stringValue
            var buyLink: String = subJson["buy_link"].stringValue
            var rating: Float = subJson["rating"].floatValue
            var movie: Movie = Movie(identifier: "\(identifier)", name: name, poster: UIImage(named: poster)!, sinopsis: sinopsis, category: category, rating: UInt(rating), buyLink: buyLink)
            self.movies.append(movie)
        }
        
        // Theaters
        for (index: String, subJson: JSON) in theaters {
            var name: String = subJson["name"].stringValue
            var address: String = subJson["address"].stringValue
            var latitude: Float = subJson["latitude"].floatValue
            var longitude: Float = subJson["longitude"].floatValue
            var location: CLLocation = CLLocation(latitude: Double(latitude), longitude: Double(longitude))
            var billboard = subJson["billboard"]
            var movies: [Movie] = [Movie]()
            
            for (index: String, movieJson: JSON) in billboard {
                var identifier: String = movieJson["movie_id"].stringValue
                var movie: Movie? = self.movies.filter({ (m: Movie) -> Bool in
                    return m.identifier == identifier
                }).first
                if movie == nil { return }
                var sessions = movieJson["sessions"]
                
                for (index: String, sJson: JSON) in sessions {
                    let time: String = sJson["time"].stringValue
                    let extra: String = sJson["extra"].stringValue
                    let session: Session = Session(time: time, extra: extra)
                    movie?.sessions.append(session)
                }
                movies.append(movie!)
            }
            
            var theater: Theater = Theater(name: name, address: address, location: location)
            theater.movies = movies
            self.theaters.append(theater)
        }
    }
}


extension FakeAPIClient: APIClientProtocol
{
    func getNearTheater(location: CLLocation) -> Theater?
    {
        for (theater: Theater) in self.theaters {
            let distance = theater.distance(fromLocation: location)
            if  distance < maximumTheaterDistance {
                return theater
            }
        }
        return nil
    }
    
    func getMovieInfo(identifier: String) -> Movie?
    {
        // TODO
        return nil
    }
}