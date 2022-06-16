//
//  lownMower.swift
//  MTL
//
//  Created by Саша  Мінаєв on 28.05.2022.
//

import Foundation

class LownMover{
    private let name:String;
    public func getName() -> String{
        return self.name
    }
    init(nameSet:String) {
        self.name = nameSet
    }
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey: "name")
//    }
//
//    required init?(coder: NSCoder) {
//        self.name = coder.decodeObject(forKey: "name") as! String
//    }
}
