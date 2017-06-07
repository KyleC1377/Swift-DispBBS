//
//  HotTextTableViewController.swift
//  kDisp BBS
//
//  Created by KyleCheng on 2017/5/24.
//  Copyright © 2017年 KyleCheng. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class HotTextTableViewController: UITableViewController {

    // MARK: - var alloc
    
    let dispApiUrl = "https://disp.cc/api/"
    let hotTextUrl = "hot_text.json"
    var hotDataArray:[Any]?

    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.refreshControl?.addTarget(
            self,
            action: #selector(pullToRefreshData),
            for: UIControlEvents.valueChanged)
        
        parseData()
        
    }
    
    // MARK: - parseData method

    func pullToRefreshData()
    {
        parseData()
    }
    
    
    func parseData()
    {
        let urlString = dispApiUrl + hotTextUrl
    
        //Alamofire.request(Method, URLString, parameters, encoding, headers)
        Alamofire.request(urlString,method:.get).responseJSON { response in
            
            self.refreshControl?.endRefreshing() //停止刷新動畫
            
            guard response.result.isSuccess else {
                let errorMessage = response.result.error?.localizedDescription
                
                self.alert(message: errorMessage!)

                return
            }
            guard let JSON = response.result.value as? [String: Any] else {
                self.alert(message: "JSON formate error")

                return
            }

            //來自api的 errCode 推測
            if let errCode = JSON["err"] as? Int
            {
                if errCode != 0
                {
                    self.alert(message: "data error code is : \(errCode)")
                    return
                }
            }
            
            print("\n [Fetch DATA] :\(JSON)")
            
            if let list = JSON["list"] as? [Any] {
                
                self.hotDataArray = list
                self.tableView.reloadData()
            }
        }

    }
    
    
    func alert(message: String) {
        let alert = UIAlertController(title: "錯誤訊息", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let num = self.hotDataArray?.count {
            return num
        } else {
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //從記憶內有的cell優先獲取
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotTextCell", for: indexPath) as! HotTextCell

        //解析Dict
        
        //資料結構若不等於 [String : Any], KICK!
        guard let hotData = self.hotDataArray?[indexPath.row] as? [String : Any] else {
            print("Get row \(indexPath.row) error")
            return cell
        }

        cell.titleLabel?.text = hotData["title"] as? String
        cell.descLabel?.text = hotData["desc"] as? String
        
        //多張縮圖
        let imgUrls = hotData["img_list"] as? [String];
        let placeholderImage = UIImage(named: "tabview-def-Image");
        
        if imgUrls?.count != 0 {
            let url = URL(string: (imgUrls?[0])!)!
            cell.thumbImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        else
        {
            cell.thumbImageView?.image = placeholderImage;
        }

//        cell.titleLabel?.text = "Test dataTest dataTest dataTest dataTest data ROW: \(indexPath.row)";
//        cell.descLabel?.text = "理論上外層 Function 執行完他擁有的 Context 就會消失，但 Nested Funtion 有個神奇的能力 - 回傳的 Function 可以存取以下資料：";
//        
//        cell.thumbImageView?.image = UIImage(named: "tabview-def-Image");

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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "OPENWEBVC"
    {
        //前往目標頁面時先確認
//        1.segue是否與預期的vc同個
//        2.點擊欄位index是否正確
//        3.確保有資料
//        4.pass Data
            guard let myWebvc = segue.destination as? WebViewController,
            let row = self.tableView.indexPathForSelectedRow?.row,
            let hotData = self.hotDataArray?[row] as? [String:Any]
            else{return}
        
            myWebvc.urlString = hotData["url"] as? String
        
        }
        
        
        
        
        
    }
 

}
