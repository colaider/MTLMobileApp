//
//  LownAddViewController.swift
//  MTL
//
//  Created by Саша  Мінаєв on 09.06.2022.
//

import UIKit

class LownAddViewController: UIViewController {
    @IBOutlet weak var addLown: UIButton!
    var runOrAdd = false;
    var arr:[LownMover] = []
    var textFrotextField = ""
    var finalArr:[SheduleClass] = [];
    @IBOutlet weak var addLownTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addLown.layer.cornerRadius = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func addLownButton(_ sender: UIButton) {
        textFrotextField = addLownTextField.text ?? ""
        arr.append(LownMover(nameSet: textFrotextField))
        performSegue(withIdentifier: "showlown", sender: Any?.self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LownViewController
        vc.arrOfLown = self.arr
        vc.finalArr = self.finalArr
        vc.runOrAdd = self.runOrAdd
    }
}
