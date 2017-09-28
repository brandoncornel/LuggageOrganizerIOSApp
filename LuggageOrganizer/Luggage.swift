//
//  Luggage.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/25/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit
import os.log


class Luggage: NSObject, NSCoding{
    var name: String
    var photo: UIImage?
    var detailedDescription: String
    
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("luggages")
    struct PropertyKey{
        static let name = "name"
        static let photo = "photo"
        static let detailedDescription = "detailedDescription"
    }
    
    init?(name: String, photo: UIImage?, detailedDescription: String){
        if(name.isEmpty || detailedDescription.isEmpty){
            return nil
        }
        self.name = name
        self.photo = photo
        self.detailedDescription = detailedDescription
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(detailedDescription, forKey: PropertyKey.detailedDescription)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        guard let detailedDescription = aDecoder.decodeObject(forKey: PropertyKey.detailedDescription) as? String else {
            os_log("Unable to decode the description for a Luggage object.", log: OSLog.default, type: .debug)
            return nil
        }

        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Luggage object.", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(name: name, photo: photo, detailedDescription: detailedDescription)

    }
    
    
}
