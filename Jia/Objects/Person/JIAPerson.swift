//
//  JIAPerson.swift
//  Jia
//
//  Created by Will Chilcutt on 5/18/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit
import EVReflection

class JIAPerson : CKDataObject
{
    let name : String
    
    init(withName name : String)
    {
        self.name = name
    }
    
    required init()
    {
        self.name = ""
    }
}
