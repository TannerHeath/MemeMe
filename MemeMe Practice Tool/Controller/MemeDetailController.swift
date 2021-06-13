//
//  MemeDetailController.swift
//  MemeMe Practice Tool
//
//  Created by Tanner Heath on 1/27/21.
//

import Foundation
import UIKit

class MemeDetailController: UIViewController {
    
    var selectedMeme: UIImage!
    
    @IBOutlet weak var memeDetailImageView: UIImageView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memeToLoad = selectedMeme {
            memeDetailImageView.image = memeToLoad
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func shareButton(_ sender: Any) {
    
        let activityController = UIActivityViewController(activityItems: [selectedMeme as Any], applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
        
        activityController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed:Bool, arrayReturnedItems: [Any]?, error: Error?) in
            if completed {
                self.navigationController?.popViewController(animated: true)
            }
            
            else {
                return
            }
        }
    }
}
