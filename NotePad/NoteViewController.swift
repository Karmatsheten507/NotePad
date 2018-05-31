//
//  NoteViewController.swift
//  NotePad
//
//  Created by Nando Septian Husni on 5/28/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var etTitle: UITextField!
    
    @IBOutlet weak var etDate: UITextField!
    @IBOutlet weak var etPlace: UITextField!
    
    @IBOutlet weak var etTime: UITextField!
    
    @IBOutlet weak var etDesc: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        // making  the context for the app
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // declaring our task var
        
        let noteTask = Note(context: context)
        // for setting the entities to become just like what we typr inside the textfield
        noteTask.noteTitle = etTitle.text
        noteTask.noteDate = etDate.text
        noteTask.noteDesc = etDesc.text
        noteTask.noteTime = etTime.text
        noteTask.notePlace = etPlace.text
        
        // the condition when we left our texts empty
        
        if etTitle.text == ""{
            let alert = UIAlertController(title: "Warning", message: "You can/t leave it empty", preferredStyle: UIAlertControllerStyle.alert)
            
            // adding the cancel button/ok  button
            alert.addAction(UIAlertAction(title: "OKie", style: .default, handler: nil))
        }else if etDate.text == ""{
            let alert = UIAlertController(title: "warning date" , message: "Fill IT!", preferredStyle: UIAlertControllerStyle.alert )
            
            alert.addAction(UIAlertAction(title: "Okie", style: .default, handler: nil))
            
            
    
        }else if etDesc.text == ""{
            let alert = UIAlertController(title: "warning date" , message: "Fill IT!", preferredStyle: UIAlertControllerStyle.alert )
            
            alert.addAction(UIAlertAction(title: "Fine", style: .default, handler: nil))
            
            
            }
        else if etTime.text == ""{let alert = UIAlertController(title: "warning date" , message: "Fill IT!", preferredStyle: UIAlertControllerStyle.alert)
            
               alert.addAction(UIAlertAction(title: "Got IT", style: .default, handler: nil))
    
    }
        else if etPlace.text == ""{let alert = UIAlertController(title: "warning date" , message: "Fill IT!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Got IT", style: .default, handler: nil))
            
        }
        
        else{
            // the condition when the text is filled
            // the text will be saved to the core data and show it on your view controller
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
             navigationController?.popViewController(animated: true)
           // print the result
            print("saved")
            
            
        }
    }
}
