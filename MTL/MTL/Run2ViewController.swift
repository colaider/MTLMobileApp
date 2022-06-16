//
//  Run2ViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 15.06.2022.
//

import UIKit

class Run2ViewController: UIViewController {

    

    @IBOutlet weak var runFuck: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        runFuck.layer.cornerRadius = runFuck.frame.width / 2;
        runFuck.layer.borderColor = #colorLiteral(red: 0.5896764398, green: 0.8220958114, blue: 0.4277451634, alpha: 1)
        runFuck.layer.borderWidth = 10;
        runFuck.layer.shadowRadius = 10
        runFuck.layer.shadowOpacity = 1.0
        runFuck.layer.shadowOffset = CGSize(width: 3, height: 3)
        runFuck.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        runFuck.layer.masksToBounds = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
