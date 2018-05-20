//
//  JIAGroup.swift
//  Jia
//
//  Created by Will Chilcutt on 5/18/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit
import EVReflection

class JIAGroup : CKDataObject
{
    let name    : String
    var people  : [JIAPerson]
    
    init(withName name : String)
    {
        self.name   = name
        self.people = []
    }
    
    required init()
    {
        self.name   = ""
        self.people = []
    }
}
