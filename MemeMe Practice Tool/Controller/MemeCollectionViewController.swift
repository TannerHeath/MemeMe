//
//  MemeCollectionViewController.swift
//  MemeMe Practice Tool
//
//  Created by Tanner Heath on 1/12/21.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MemeDetailController") as? MemeDetailController {
            controller.selectedMeme = appDelegate.memes[indexPath.row].memedImage
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellsInRow = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(cellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(cellsInRow))

        return CGSize(width: size, height: size)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        // Set the label and image
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    @IBAction func generateNewMeme(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MemeMeViewController") as? MemeGeneratorViewController {
            navigationController?.pushViewController(controller, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
    }
}

