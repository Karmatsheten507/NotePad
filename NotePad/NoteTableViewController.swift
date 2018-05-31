//
//  NoteTableViewController.swift
//  NotePad
//
//  Created by Nando Septian Husni on 5/28/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    //creating vsariable for the note(coredata)
    var notes: [Note] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // var for onclick
    var titleselected : String?
    var dateSelected : String?
    var descSelected : String?
    var timeSelected : String?
    var placeSelected : String?
    
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as! NotePadTableViewCell

        // Configure the cell...
        let notetask = notes[indexPath.row]
        
        
        if let MynoteTask = notetask.noteTitle{
            cell.lblTitle.text = MynoteTask
        }
        if let MynoteTask2 = notetask.noteDate{
            cell.lblDate.text = MynoteTask2
        }
        
        if let MynoteTask3 = notetask.noteDesc{
            cell.lblDesc.text = MynoteTask3

    }
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        //setting height cell
        return 150
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        getData()
        tableView.reloadData()
        
    }
    
    
    func getData ()
    {
    do {
        notes = try context.fetch(Note.fetchRequest())
        
        }
    catch {
        print("FAIL/ERROR/EXPLOED")
    
    }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = notes[indexPath.row]
            context.delete(task)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                notes = try context.fetch(Note.fetchRequest())
            }catch{
            print("Error")
            }
            // re- load
            tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Row \(indexPath.row)selected")
            
            let datatask = notes[indexPath.row]
            
            titleselected = datatask.noteTitle
            dateSelected = datatask.noteDate
            descSelected = datatask.noteDesc
            timeSelected = datatask.noteTime
            placeSelected = datatask.notePlace
            
            //perform the segue function to the detailView Controller
            performSegue(withIdentifier: "PassData", sender: self)
        }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //checkin the segue
        
        if segue.identifier == "PassData"
        {
            let sendData = segue.destination as! DetailViewController
            
            sendData.catchDate = dateSelected
            sendData.catchDesc = descSelected
            sendData.catchPlace = placeSelected
            sendData.catchTime =  timeSelected
            sendData.catchTitle = titleselected
            
            
        }
        }
    


}
