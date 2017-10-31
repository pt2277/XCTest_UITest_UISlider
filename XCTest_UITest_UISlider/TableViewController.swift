//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Papoj Thamjaroenporn on 2/21/17.
//  Copyright © 2017 Papoj Thamjaroenporn. All rights reserved.
//

import UIKit
import os.log

class TableViewController
    : UITableViewController
{

    var data: [Int]!
    var specialIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        data = [10, 2]
        
        os_log("%@:%@:%lu: %lu", log: .default, type: .debug, #file, #function, #line, 12)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.configureValue = Float(data[indexPath.row])
        
        cell.accessibilityLabel = "cell \(indexPath.row)"
        cell.valueSlider.accessibilityLabel = "value label"
        cell.valueSlider.accessibilityLabel = "value slider"
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//
//        print("willSelectRowAt \(indexPath.row)")
//        if tableView.indexPathForSelectedRow == indexPath {
//            tableView.deselectRow(at: indexPath, animated: false)
//            return nil
//        }
//
//        return indexPath
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("didSelectRowAt \(indexPath.row)")
//    }
//
//    override func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
//        print("willDeselectRowAt \(indexPath.row)")
//        return indexPath
//    }
//
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print("didDeselectRowAt \(indexPath.row)")
//    }
    
    
//    func cellButtonPressed(_ sender: TableViewCell) {
//
//        return
//
//        data.insert(100, at: 0)
//        let newIndexPath = IndexPath(row: 0,
//                                     section: 0)
//
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
//
//
//        selectDisplayCell(from: tableView, at: newIndexPath)
////        tableView.selectRow(at: newIndexPath, animated: false, scrollPosition: .middle)
//
////        moveDownPair(sender)
////
////        guard let indexPath = tableView.indexPath(for: sender) else {
////            return
////        }
////
////        let cell = tableView.cellForRow(at: indexPath)
////        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
////        print("\(cell?.isSelected)")
////        tableView.deselectRow(at: indexPath, animated: false)
////        print("\(cell?.isSelected)")
//    }
    
    
//    func selectDisplayCell(from tableView: UITableView, at indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else {
//            return
//        }
//        
//        guard !cell.isSelected else {
//            return
//        }
//        
//        if let respond = tableView.delegate?.responds(
//            to: #selector(tableView(_:willSelectRowAt:))),
//            respond == true {
//            tableView.delegate?.tableView!(tableView, willSelectRowAt: indexPath)
//        }
//        
//        
//        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
//        
//        if let respond = tableView.delegate?.responds(
//            to: #selector(tableView(_:didSelectRowAt:))),
//            respond == true {
//            tableView.delegate?.tableView!(tableView, didSelectRowAt: indexPath)
//        }
//        
//    }
//    
//    func moveDownPair(_ sender : TableViewCell, by dist: Int = 3) {
//    
//        guard let indexPath = tableView.indexPath(for: sender) else {
//            return
//        }
//        
//        let rightUnderIndexPath = IndexPath(item: indexPath.row + 1, section: 0)
//        
//        let newIndexPath = IndexPath(item: indexPath.row + dist, section: 0)
//        let newRightUnderIndexPath = IndexPath(item: rightUnderIndexPath.row + dist, section: 0)
//        
//        
//        specialIndexPath = newRightUnderIndexPath
//        
//        let tempElem = data.remove(at: indexPath.row)
//        data.insert(tempElem, at: newIndexPath.row)
//        
//        tableView.beginUpdates()
//        tableView.moveRow(at: indexPath, to: newIndexPath)
////        tableView.moveRow(at: rightUnderIndexPath, to: newRightUnderIndexPath)
//        tableView.endUpdates()
//     
//        tableView.scrollToRow(at: newIndexPath, at: .none, animated: true)
//        
////        tableView.reloadRows(at: [newIndexPath, newRightUnderIndexPath], with: .automatic)
//    
//    }
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
