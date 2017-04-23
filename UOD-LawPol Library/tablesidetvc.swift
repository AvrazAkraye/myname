//
//  tablesidetvc.swift
//  UOD-LawPol Library
//
//  Created by avraz on 4/9/17.
//  Copyright © 2017 avraz. All rights reserved.
//

import UIKit
import SafariServices


protocol languagep{
    func setlanguage(data: String)
}


class tablesidetvc: UITableViewController{
    let delegatelanguage: languagep? = nil
    
    @IBOutlet var maintableview: UITableView!
    @IBOutlet weak var actiontb: UITableView!
    let aa = tabbarViewController();
    

    
let item = ["kurdish","Arabic","English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up your background color view
        let colorView = UIView()
        colorView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 10, alpha: 1)
        UITableViewCell.appearance().selectedBackgroundView = colorView
        
        
        // background
        tableView.backgroundColor = UIColor.black
        actiontb.backgroundColor = UIColor.black

        actiontb.dataSource = self
        actiontb.delegate = self
           }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == actiontb {
             return 4
        }
        return item.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == actiontb){
            let cell = actiontb.dequeueReusableCell(withIdentifier: "actioncell", for: indexPath) as UITableViewCell
            cell.backgroundColor = UIColor.black
            cell.textLabel?.textColor = UIColor.white
            if indexPath.row == 0 {
                cell.textLabel?.text = "Facebook Page"
               cell.imageView?.image = UIImage(named: "2.png")
            }
            if indexPath.row == 1 {
                cell.textLabel?.text = "LAW-POL Website"
                cell.imageView?.image = UIImage(named: "4.png")
            }
            if indexPath.row == 2 {
                cell.textLabel?.text = "Contact Us"
                cell.imageView?.image = UIImage(named: "1.png")
            }
            if indexPath.row == 3 {
                cell.textLabel?.text = "Location"
                cell.imageView?.image = UIImage(named: "3.png")
            }
      
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! ccell
        cell.textcell!.text = item[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textcell!.textColor = UIColor.white
        
        if indexPath.row == 0 {
            cell.imagecell!.image = UIImage(named: "ku.png")
            
        }
        if indexPath.row == 1 {
             cell.imagecell!.image = UIImage(named: "ar")        }
        if indexPath.row == 2 {
 cell.imagecell!.image = UIImage(named: "usa.png")        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
      
        if(tableView == maintableview){
            if indexPath.row == 0{
          // tabbarpr
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

               
                let controller = storyboard.instantiateViewController(withIdentifier: "aboutus") as! aboutwebVc
controller.url = "http://www.youtube.com"
          self.present(controller, animated: true, completion: nil)
                
               
           }
            
            if(indexPath.row == 1){
                            }
            if(indexPath.row == 2){
                
            }

        }
        
        if(tableView == actiontb){

            if indexPath.row == 0 {
                guard let facebookURL = NSURL(string: "fb://page/?id=316868598514314") else {
                    return
                }
                
                if (UIApplication.shared.canOpenURL(facebookURL as URL)) {
                    UIApplication.shared.openURL(facebookURL as URL)
                } else {
                    
                    guard let webpageURL = NSURL(string: "http://facebook.com/316868598514314/") else {
                        return
                    }
                    
                    UIApplication.shared.openURL(webpageURL as URL)
                }
            }
            
            if indexPath.row == 1 {
           
                let svc = SFSafariViewController(url: URL(string:"http://web.uod.ac/ac/c/clp/")!)
                self.present(svc, animated: true, completion: nil)
            }
            
            
            // contact us
              if indexPath.row == 2 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let main = storyboard.instantiateViewController(withIdentifier: "Contactvc")
                self.present(main, animated: true, completion: nil)
            }
            // location
            if indexPath.row == 3 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let main = storyboard.instantiateViewController(withIdentifier: "locationVC")
                self.present(main, animated: true, completion: nil)
                
            }
          
          
        }
        
    }
    
    
    
    
    
    
    
    



}
