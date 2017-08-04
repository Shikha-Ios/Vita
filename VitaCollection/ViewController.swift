//
//  ViewController.swift
//  VitaCollection
//
//  Created by Shikha Singla on 8/2/17.
//  Copyright © 2017 Shikha Singla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelMedia: UILabel!
    @IBOutlet var LabelEvent: UILabel!
    @IBOutlet var viewCollect: UIView!
    @IBOutlet var collectionMedia: UICollectionView!
    @IBOutlet var tableVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionMedia.isHidden = true
        self.setNavigationBarItem()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    @IBAction func btnMyeventAction(_ sender: Any)
    {
        LabelEvent.backgroundColor = UIColor.blue
        labelMedia.backgroundColor = UIColor.gray
        collectionMedia.isHidden = true
        tableVw.isHidden = false
        tableVw.reloadData()
    }

    @IBAction func btnMyMediaAction(_ sender: Any)
    {
        labelMedia.backgroundColor = UIColor.blue
        LabelEvent.backgroundColor = UIColor.gray

        tableVw.isHidden = true
        collectionMedia.isHidden = false
        collectionMedia.reloadData()
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate
{
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    
    {
        let headerview = UINib(nibName: "TableHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableHeaderView
        
        if section == 0
        {
            return headerview
  
        }
        else if section == 1
        {
            return headerview

        }
        else
        {
            return headerview

        }
            }
    
}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if collectionView == collectionMedia
        {
            return 40
        }
        else{
          return 7
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == collectionMedia
        {
            let cell = collectionMedia.dequeueReusableCell(withReuseIdentifier: "CellIndentifier1", for: indexPath)
            cell.backgroundColor = UIColor.black
            return cell
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIndentifier", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
        }
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 3
        let yourWidth = (self.collectionMedia!.frame.width - (numberOfColumns - 1)) / numberOfColumns
        return CGSize(width: yourWidth, height: yourWidth)
    }
}
