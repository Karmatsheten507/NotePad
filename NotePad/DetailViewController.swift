//
//  DetailViewController.swift
//  NotePad
//
//  Created by Nando Septian Husni on 5/28/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDate: UILabel!
    
    @IBOutlet weak var detailPlace: UILabel!
    
    @IBOutlet weak var detailTime: UILabel!
    
    @IBOutlet weak var detailDesc: UILabel!
    
    @IBOutlet weak var detailTitile: UILabel!
    
    // variable to catch data the we can send from NoteTableViewController
    var catchTitle: String?
    var catchPlace: String?
    var catchDesc: String?
    var catchTime: String?
    var catchDate: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the detail
        
        detailTitile.text = "" + catchTitle!
        detailDate.text = "" + catchDate!
        detailDesc.text = "" + catchDesc!
        detailPlace.text = "" + catchPlace!
        detailTime.text = "" + catchTime!
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
