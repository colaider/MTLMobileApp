//
//  MapAddViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 09.06.2022.
//

import UIKit

class MapAddViewController: UIViewController {
    @IBOutlet weak var addMap: UIButton!
    var runOrAdd = false;
    var arrMap:[Map] = [];
    var addtext:String = ""
    var lown:LownMover = LownMover(nameSet: "")
    var finalArr:[SheduleClass] = [];
    @IBOutlet weak var adMapTextField: UITextField!
    @IBAction func adMapButton(_ sender: Any) {
        addtext = adMapTextField.text ?? ""
        arrMap.append(Map(nameSet: addtext))
        performSegue(withIdentifier: "addMapFromTextField", sender: Any?.self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addMap.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MapViewController
        vc.arrOfMap = self.arrMap
        vc.finalArr = self.finalArr
        vc.getLown = self.lown
        vc.runOrAdd = self.runOrAdd
    }

}
