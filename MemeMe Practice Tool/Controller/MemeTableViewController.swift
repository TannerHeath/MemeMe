//
//  MemeTableViewController.swift
//  MemeMe Practice Tool
//
//  Created by Tanner Heath on 1/12/21.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 128
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        let meme: Meme = appDelegate.memes[indexPath.row]
        
        // Set the label and image
        cell.topTextLabel.text = meme.topText
        cell.bottomTextLabel.text = meme.bottomText
        cell.memedImage.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MemeDetailController") as? MemeDetailController {
            controller.selectedMeme = appDelegate.memes[indexPath.row].memedImage
            navigationController?.pushViewController(controller, animated: true)
        }
    }
        
    @IBAction func generateNewMeme(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MemeMeViewController") as? MemeGeneratorViewController {
            navigationController?.pushViewController(controller, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
    }
}
