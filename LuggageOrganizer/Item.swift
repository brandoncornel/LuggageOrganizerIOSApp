//
//  Item.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/29/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit
import os.log


class Item: NSObject{
    var name: String
    var photo: UIImage?
    var quantity: Int

    init?(name: String, photo: UIImage?, quantity: Int){
        if(name.isEmpty || quantity<=0){
            return nil
        }
        self.name = name
        self.photo = photo
        self.quantity = quantity
        super.init()
    }
    
}
