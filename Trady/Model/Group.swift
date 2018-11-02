//
//  Group.swift
//  Trady
//
//  Created by Sherif Kamal on 11/2/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import Foundation

class Group {
    
    private var _title: String
    private var _description: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        self._title = title
        self._description = description
        self._key = key
        self._memberCount = memberCount
        self._members = members
    }
}
