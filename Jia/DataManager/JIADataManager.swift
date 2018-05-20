//
//  JIADataManager.swift
//  Jia
//
//  Created by Will Chilcutt on 5/16/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit
import CloudKit

class JIADataManager: NSObject
{
    static let sharedInstance : JIADataManager = JIADataManager()
    
    private let database : CKDatabase = CKContainer.default().sharedCloudDatabase
    
    func createNewGroup(_ group : JIAGroup)
    {
        
    }
}
