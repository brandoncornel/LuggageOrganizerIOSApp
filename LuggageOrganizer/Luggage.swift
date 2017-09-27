//
//  Luggage.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/25/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit

class Luggage{
    var name: String
    var photo: UIImage?
    var description: String
    
    init?(name: String, photo: UIImage?, description: String){
        if(name.isEmpty || description.isEmpty){
            return nil
        }
        self.name = name
        self.photo = photo
        self.description = description
    }
    
    
}
