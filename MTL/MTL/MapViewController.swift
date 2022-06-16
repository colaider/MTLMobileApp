//
//  MapViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 09.06.2022.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var runOrAdd = false;
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MapTableViewCell",
                                  bundle: nil)
        mapTableView.register(textFieldCell,
                                forCellReuseIdentifier: "MapTableViewCell")
        mapTableView.register(UINib(nibName: "MapTableViewCell", bundle: nil), forCellReuseIdentifier: "MapTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfMap.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
        cell.setName(name: arrOfMap[indexPath.row].getName())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        givemap = arrOfMap[indexPath.row]
        if(runOrAdd == false){
            print(runOrAdd)
            performSegue(withIdentifier: "setDate", sender: nil)
        }else{
            print(runOrAdd)
            performSegue(withIdentifier: "showRunButton", sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            arrOfMap.remove(at: indexPath.row)
            mapTableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    @IBOutlet weak var mapTableView: UITableView!
    @IBAction func addSomeShit(_ sender: Any) {
        performSegue(withIdentifier: "openAddMoverVindow", sender: Any?.self)
    }
    @IBOutlet weak var addMap: UIButton!
    var arrOfMap:[Map] = [Map(nameSet: "Pablo"), Map(nameSet: "Pachini"),]
    var getLown:LownMover = LownMover(nameSet: "");
    var givemap:Map = Map(nameSet: "")
    var tryIt:String = ""
    var finalArr:[SheduleClass] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        mapTableView.delegate = self
        mapTableView.dataSource = self
        mapTableView.layer.cornerRadius = 5
        registerTableViewCells()
        addMap.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openAddMoverVindow"){
            let vc = segue.destination as! MapAddViewController
            vc.arrMap = self.arrOfMap
            vc.finalArr = self.finalArr
            vc.lown = self.getLown
            vc.runOrAdd = self.runOrAdd
        }else if(segue.identifier == "setDate"){
            let vc = segue.destination as! SetDateViewController
            vc.finalArr = self.finalArr
            vc.lown = self.getLown
            vc.map = self.givemap
        }else if(segue.identifier == "back"){
            let vc = segue.destination as! LownViewController
            vc.finalArr = self.finalArr
            vc.runOrAdd = self.runOrAdd
        }
    }

}
