//
//  HotTextTableViewController.swift
//  kDisp BBS
//
//  Created by KyleCheng on 2017/5/24.
//  Copyright © 2017年 KyleCheng. All rights reserved.
//

import UIKit

class HotTextTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //從記憶內有的cell優先獲取
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotTextCell", for: indexPath) as! HotTextCell

        //cell.textLabel?.text = "Test data ROW: \(indexPath)";
        //cell.detailTextLabel?.text = "理論上外層 Function 執行完他擁有的 Context 就會消失，但 Nested Funtion 有個神奇的能力 - 回傳的 Function 可以存取以下資料：";
        
        cell.titleLabel?.text = "Test dataTest dataTest dataTest dataTest data ROW: \(indexPath.row)";
        
        cell.descLabel?.text = "理論上外層 Function 執行完他擁有的 Context 就會消失，但 Nested Funtion 有個神奇的能力 - 回傳的 Function 可以存取以下資料：";
        
        cell.thumbImageView?.image = UIImage(named: "tabview-def-Image");

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
