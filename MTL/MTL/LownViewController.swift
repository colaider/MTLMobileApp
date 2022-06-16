//
//  LownViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 08.06.2022.
//

import UIKit

class LownViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var runOrAdd = false;
    var textFromField = ""
    var finalArr:[SheduleClass] = [];
    var transferLown:LownMover = LownMover(nameSet: "")
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "LownTableViewCell",
                                  bundle: nil)
        lownTableView.register(textFieldCell,
                                forCellReuseIdentifier: "LownTableViewCell")
        lownTableView.register(UINib(nibName: "LownTableViewCell", bundle: nil), forCellReuseIdentifier: "LownTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfLown.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LownTableViewCell", for: indexPath) as! LownTableViewCell
        cell.setName(name: arrOfLown[indexPath.row].getName())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("you tped me")
       transferLown = arrOfLown[indexPath.row]
       performSegue(withIdentifier: "mapListShow", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            arrOfLown.remove(at: indexPath.row)
            lownTableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }

    
    
    @IBOutlet weak var lownTableView: UITableView!
    @IBOutlet weak var addLown: UIButton!
    var arrOfLown:[LownMover] = [
        LownMover(nameSet: "Map1"),
        LownMover(nameSet: "Luas"),
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        lownTableView.delegate = self
        lownTableView.dataSource = self
        lownTableView.layer.cornerRadius = 5
        registerTableViewCells()
        addLown.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func addLown(_ sender: Any) {
        performSegue(withIdentifier: "tramsFerToaddLown", sender: Any?.self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "tramsFerToaddLown"){
            let vc = segue.destination as! LownAddViewController
            vc.arr = self.arrOfLown
            vc.finalArr = self.finalArr
            vc.runOrAdd = self.runOrAdd
        }else if(segue.identifier == "mapListShow"){
            let vc = segue.destination as! MapViewController
            vc.getLown = self.transferLown
            vc.finalArr = self.finalArr
            vc.runOrAdd = self.runOrAdd
        }else if(segue.identifier == "back0"){
            let vc = segue.destination as! ViewController
            vc.arrOfSheduleObjects = self.finalArr
            vc.runOrAdd = self.runOrAdd
        }
    }
}



