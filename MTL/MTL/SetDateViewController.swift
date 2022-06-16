//
//  SetDateViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 09.06.2022.
//

import UIKit

class SetDateViewController: UIViewController {
    
    @IBOutlet weak var dateSetter: UIDatePicker!
    @IBOutlet weak var modalPoUp: UIView!
    var dateString = ""
    var map:Map = Map(nameSet: "")
    var lown:LownMover = LownMover(nameSet: "")
    var finalArr:[SheduleClass] = [];
    var finalShedule:SheduleClass = SheduleClass(lownMover: LownMover(nameSet: ""),
                                                 map: Map(nameSet: ""),
                                                 dateSetter: "")
    @IBOutlet weak var add: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        add.layer.cornerRadius = 10
        modalPoUp.layer.cornerRadius = 10
        modalPoUp.clipsToBounds = true
              
              // To provide the shadow
        modalPoUp.layer.shadowRadius = 10
        modalPoUp.layer.shadowOpacity = 1.0
        modalPoUp.layer.shadowOffset = CGSize(width: 3, height: 3)
        modalPoUp.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        modalPoUp.layer.masksToBounds = false
        
    }
    @IBAction func closePoUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func finishAdding(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.calendar = dateSetter.calendar
        formatter.dateFormat = "HH:mm E, d MMM y"
        dateString = formatter.string(from: dateSetter.date)
        finalShedule.mapSet(mapSet: map)
        finalShedule.lownMoverSet(lownMoverSet: lown)
        finalShedule.dateSet(dateSet: dateString)
        finalArr.append(finalShedule)
        print(lown.getName())
        print(map.getName())
        performSegue(withIdentifier: "seveSheduleMapLow", sender: Any?.self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.arrOfSheduleObjects = self.finalArr
    }

}
