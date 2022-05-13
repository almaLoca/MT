//
//  TableViewCell.swift
//  MT
//
//  Created by Reshma on 17/02/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    var dateArray: [BodyList] = []
    var bannerArray: [BannerList] = []
    var viewModelUser = ListViewModel()
    @IBOutlet var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var isBigCell = false
    func config(isBigCell: Bool,data: [BodyList], banner:  [BannerList] ) {
        self.isBigCell = isBigCell
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        let flowLAyout = UICollectionViewFlowLayout()
        if isBigCell {
            bannerArray = banner
            flowLAyout.itemSize = CGSize(width: 275, height: 310)
        }else{
            dateArray = data
            flowLAyout.itemSize = CGSize(width: 220, height: 280)
        }
        print(dateArray)
        flowLAyout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        flowLAyout.scrollDirection = .horizontal
        self.collectionView.setCollectionViewLayout(flowLAyout, animated: true)
    }

}
extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isBigCell {
            return bannerArray.count
        }else{
            return dateArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isBigCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bigCell", for: indexPath) as! CollectionViewCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallCell", for: indexPath) as! CollectionViewCell
            return cell
        }
    }
    
    
}
