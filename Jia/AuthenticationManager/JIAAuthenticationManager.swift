//
//  JIAAuthenticationManager.swift
//  Jia
//
//  Created by Will Chilcutt on 5/16/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit

class JIAAuthenticationManager : NSObject
{
    static let sharedInstance : JIAAuthenticationManager = JIAAuthenticationManager()
    
    func isAuthenticated() -> Bool
    {
        return false
    }
}
