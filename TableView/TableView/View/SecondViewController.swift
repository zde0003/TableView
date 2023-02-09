//
//  SecondViewController.swift
//  TableView
//
//  Created by Zach Evetts on 2/3/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var info : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = info
        
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
