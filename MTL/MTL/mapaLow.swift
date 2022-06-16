//
//  mapaLow.swift
//  MTL
//
//  Created by Саша  Мінаєв on 28.05.2022.
//

import Foundation

class MapaLow{
    private var lownMover:LownMover;
    private var map:Map
    public func mapSet(mapSet:Map){
        self.map = mapSet
    }
    public func mapGet() -> Map{
        return self.map
    }
    public func lownMoverSet(lownMoverSet:LownMover){
        self.lownMover = lownMoverSet
    }
    public func lownMoverGet() -> LownMover{
        return self.lownMover
    }
    init(lownMoverSet:LownMover, mapSet:Map) {
        self.lownMover = lownMoverSet
        self.map = mapSet
    }
//    required convenience init?(coder decoder: NSCoder) {
//        guard let lownMover = decoder.decodeObject(forKey: "lownMover") as? LownMover,
//            let map = decoder.decodeObject(forKey: "map") as? Map
//            else{return nil}
//        self.init(
//            lownMoverSet: lownMover,
//            mapSet: map
//        )
//    }
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(self.lownMover, forKey: "lownMover")
//        aCoder.encode(self.map, forKey: "map")
//    }
}
