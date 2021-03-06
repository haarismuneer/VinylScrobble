//
//  Types.swift
//  VinylScrobble
//
//  Created by Haaris Muneer on 7/7/17.
//  Copyright © 2017 Haaris. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Album {
    
//    var sides: [Side]
    var title: String
    var artist: String
    var year: String?
    var label: String
    var thumbnailURL: URL?
    var resourceURL: URL
    
    init?(json: [String : Any]) {
        guard let titleAndArtist = json["title"] as? String else { print("there was an error initializing an album from the json object"); fatalError() }
        guard let labelArray = json["label"] as? [String] else { print("there was an error initializing an album from the json object"); fatalError() }
        guard let thumbnailURL = json["thumb"] as? String else { print("there was an error initializing an album from the json object"); fatalError() }
        guard let resourceURL = json["resource_url"] as? String else { print("there was an error initializing an album from the json object"); fatalError() }
        
        let titleAndArtistArray = titleAndArtist.components(separatedBy: " - ")
        let title = titleAndArtistArray.last
        let artist = titleAndArtistArray.first
        
        self.title = title!
        self.artist = artist!
        self.year = json["year"] as? String
        self.label = labelArray.first!
        self.thumbnailURL = URL(string: thumbnailURL)
        self.resourceURL = URL(string: resourceURL)!
        
    }
    
    init() {
        self.title = "Rock Creek Park"
        self.artist = "Oddisee"
        self.year = "2011"
        self.label = "Mello Music Group"
        self.thumbnailURL = URL(string: "https://i1.sndcdn.com/artworks-000023004645-sczg6t-t500x500.jpg")!
        self.resourceURL = URL(string: "https://www.google.com")!
    }
}

struct Side {
    
    var tracks: [Track]
    
}

struct Track {
    
    var title: String
    
}

struct User {
    var collection: [Album]
    
    init() {
        self.collection = []
    }
}
