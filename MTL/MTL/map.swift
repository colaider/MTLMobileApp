//
//  map.swift
//  MTL
//
//  Created by Саша  Мінаєв on 28.05.2022.
//

import Foundation

class Map{
    private let name:String;
    public func getName() -> String{
        return self.name
    }
    init(nameSet:String){
        self.name = nameSet
    }
}
