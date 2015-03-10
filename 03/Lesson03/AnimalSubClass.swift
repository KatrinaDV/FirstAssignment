//
//  AnimalSubClass.swift
//  Lesson03
//
//  Created by Katrina Voorhees on 3/9/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class AnimalSubClass: Animal {
    let type: String
    let name2: String
    init(type: String, name: String){
        self.name2 = name
        self.type = type
        super.init(name: name2)
    }

    override func prettyAnimalName() -> String {
        return "Animal name: " + self.name2 + ". Animal type: " + self.type
    }
}

