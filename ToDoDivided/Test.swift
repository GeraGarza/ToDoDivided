//
//  Test.swift
//  ToDoDivided
//
//  Created by Gera Garza on 6/26/18.
//  Copyright © 2018 Gera Garza. All rights reserved.
//


import UIKit
import RealmSwift

class Item:Object{
    @objc dynamic var title:String = ""
    @objc dynamic var done:Bool = false
    //var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    //inverse relationshipnot defined automatically
    
    //category class
    // let items = List<Items>()

}
