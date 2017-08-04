//
//  DemoViewController.swift
//  VitaCollection
//
//  Created by Shikha Singla on 8/3/17.
//  Copyright © 2017 Shikha Singla. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
 fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 1

    @IBOutlet var collectionVw: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollToNextCell(){
    
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        let contentOffset = collectionVw.contentOffset;
        collectionVw.scrollRectToVisible(CGRect(origin: CGPoint(x: contentOffset.x + cellSize.width,y :contentOffset.y),size: CGSize(width: cellSize.width, height: cellSize.height)), animated: true)
        
    }
    func scrollToPreviousCell()
    {
        
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        let contentOffset = collectionVw.contentOffset;
        collectionVw.scrollRectToVisible(CGRect(origin: CGPoint(x: contentOffset.x - cellSize.width,y :contentOffset.y),size: CGSize(width: cellSize.width, height: cellSize.height)), animated: true)
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
extension DemoViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return 7
          }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : DemoCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DemoCollectionCell
        cell.btnNextAction.addTarget(self, action:  #selector(DemoViewController.scrollToNextCell), for: .touchUpInside)
         cell.btnPrevious.addTarget(self, action:  #selector(DemoViewController.scrollToPreviousCell), for: .touchUpInside)
            cell.backgroundColor = UIColor.red
            return cell
    }
}
extension DemoViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let cellHeight = view.frame.height
        return CGSize(width: widthPerItem, height: cellHeight - 64)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
  
}
