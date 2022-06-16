//
//  ViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 27.05.2022.
//

import UIKit


enum UserDefaultsKeys: String {
    case  sheduleClass
}

//func encodel(arrOfSheduls:[SheduleClass]) -> Data{
//    do {
//        let encoded =  try NSKeyedArchiver.archivedData(withRootObject: arrOfSheduls, requiringSecureCoding: false)
//        return encoded
//    } catch is Error{
//        print(Error.self)
//    }
//    return Data()
//}
//func decodel() -> [SheduleClass]{
//    let s:[SheduleClass] = []
//    do {
//        let decoded  = UserDefaults.standard.object(forKey:UserDefaultsKeys.sheduleClass.rawValue) as! Data
//        let decodedTeams = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! [SheduleClass]
//        return decodedTeams
//    } catch is Error{
//        print(Error.self)
//    }
//    return s
//}



class ViewController: UIViewController {

    @IBAction func runRunButton(_ sender: UIButton) {
        runOrAdd = true;
    }
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var grayDownBoxes: UIView!
    @IBOutlet weak var grayDownBoxes2: UIView!
    @IBOutlet weak var addNewShedule: UIButton!
    @IBOutlet weak var sheduleTableView: UITableView!
    var runOrAdd = false;
    var arrOfSheduleObjects:[SheduleClass] = [SheduleClass(
                        lownMover: LownMover(nameSet: "hello"),
                        map: Map(nameSet: "a"),
                        dateSetter: "05 :32 Wed, 30 Oct 2019")]
    let defaults = UserDefaults.standard
    
    @IBAction func addNewShedule(_ sender: Any) {
//        arrOfSheduleObjects.append(
//            SheduleClass(
//                lownMover: LownMover(nameSet: "hello"),
//                map: Map(nameSet: "a"),
//                dateSetter: "05 :32 Wed, 30 Oct 2019")
//            )
//        let encodedData = encodel(arrOfSheduls: arrOfSheduleObjects)
//        defaults.set(encodedData, forKey: UserDefaultsKeys.sheduleClass.rawValue)
//
//        arrOfSheduleObjects = decodel()
//        sheduleTableView.beginUpdates()
//        sheduleTableView.insertRows(at: [IndexPath(row: arrOfSheduleObjects.count - 1, section: 0)], with: .automatic)
//        sheduleTableView.endUpdates()
        runOrAdd = true;
        performSegue(withIdentifier: "startAdding", sender: Any?.self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runButton.layer.cornerRadius = runButton.frame.width / 2;
        runButton.layer.borderColor = #colorLiteral(red: 0.5896764398, green: 0.8220958114, blue: 0.4277451634, alpha: 1)
        runButton.layer.borderWidth = 10;
        grayDownBoxes.layer.cornerRadius = 10;
        grayDownBoxes2.layer.cornerRadius = 10;
        addNewShedule.layer.cornerRadius = 4;
        sheduleTableView.delegate = self
        sheduleTableView.dataSource = self
        sheduleTableView.layer.cornerRadius = 5
        //sheduleTableView.register(SheduleTableViewCell.self, forCellReuseIdentifier: SheduleTableViewCell.identifier)
//        var temp:[SheduleClass] = []
//        defaults.set(temp, forKey: "sheduleArr")
//        arrOfSheduleObjects = decodel()
    }


}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tped me")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            arrOfSheduleObjects.remove(at: indexPath.row)
            sheduleTableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfSheduleObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.layer.cornerRadius = 4
        cell.textLabel?.font = cell.textLabel?.font.withSize(15)
        cell.textLabel?.text = arrOfSheduleObjects[indexPath.row].createStringInfo()
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startAdding"){
            let vc = segue.destination as! LownViewController
            vc.finalArr = self.arrOfSheduleObjects
        }else if(segue.identifier == "stratFormRun"){
            runOrAdd = true
            let vc = segue.destination as! LownViewController
            vc.runOrAdd = self.runOrAdd
        }
    }
}
