//
//  Soldier.swift
//  easy-fight
//
//  Created by R. Maia on 5/19/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Soldier: Character {
    
    override var img: String {
        get {
            return "player"
        }
    }
    
    convenience init(_hp: Int, _attackPower: Int) {
        self.init(hp: _hp, attackPower: _attackPower, name: "Soldier")
    }
    
}