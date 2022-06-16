//
//  File.swift
//  MTL
//
//  Created by Саша  Мінаєв on 28.05.2022.
//

import Foundation


class SheduleClass: MapaLow{
    

    private let dateFormatter:DateFormatter = DateFormatter()
    var date:String;
    
    public override func lownMoverGet() -> LownMover {
        return super.lownMoverGet()
    }
    public override func mapGet() -> Map {
        return super.mapGet()
    }
    
    public func getDate() -> Date{
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        let d:Date = dateFormatter.date(from: date)!
        return d
    }
    
    public override func mapSet(mapSet: Map) {
        super.mapSet(mapSet: mapSet)
    }
    public override func lownMoverSet(lownMoverSet:LownMover) {
        super.lownMoverSet(lownMoverSet: lownMoverSet)
    }
    public func dateSet(dateSet:String){
        self.date = dateSet
    }
    
    
    public func createStringInfo() -> String{
        var temp:String = ""
        let lownName:String = super.lownMoverGet().getName()
        var index = 0;
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let dateString = formatter1.string(from: self.getDate())
        
        for i in lownName{
            if(index < 3){
                temp.append(i)
            }else{
                break
            }
            index += 1
        }
        return temp + "..." + " - " + dateString
    }
    
    init(lownMover:LownMover, map:Map, dateSetter:String) {
        self.date = dateSetter
        super.init(lownMoverSet: lownMover, mapSet: map)
    }
//    required init?(coder: NSCoder) {
//        self.date = coder.decodeObject(forKey: "date") as! String
//        super.init(coder: coder)
//    }
//    override func encode(with aCoder: NSCoder) {
//        aCoder.encode(self.date, forKey: "date")
//    }
}
