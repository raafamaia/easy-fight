//
//  Character.swift
//  easy-fight
//
//  Created by R. Maia on 5/19/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPower: Int = 20
    private var _name: String = "Player"
    
    var hp: Int {
        get {
            return self._hp
        }
    }
    
    var attackPower: Int {
        get {
            return self._attackPower
        }
    }
    
    var name: String {
        get {
            return self._name
        }
    }
    
    var isAlive: Bool {
        get {
            return self.hp > 0
        }
    }
    
    var img: String {
        get {
            return ""
        }
    }
    
    init(hp: Int, attackPower: Int, name: String) {
        self._hp = hp
        self._attackPower = attackPower
        self._name = name
    }
    
    func attemptAttack(attackPower: Int) {
        _hp -= attackPower
    }
    
}