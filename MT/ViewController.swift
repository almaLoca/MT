//
//  ViewController.swift
//  MT
//
//  Created by Reshma on 16/02/21.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerView: ImageSlideshow!
    var viewModelUser = ListViewModel()
    @IBOutlet var tableView: UITableView!
    var localSource = [ImageSource]()
    var bannerArray = [BannerList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUsreDataAF()
        //self.configerForBanner(array: (viewModelUser.arrUsers.data?.banner?.list)!)
    }
    func configerForBanner(array:[BannerList]) {
        /*for index in 0..<array.count{
            let urlString1 = (array[index].image)!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let url:URL? = URL(string: urlString1)
            let data = (try? Data(contentsOf: url!)) ?? Data()
            let image = UIImage(data: data) ?? UIImage()
            localSource.append(ImageSource.init(image: image))
        }
        */
        let localSource = [ BundleImageSource(imageString: "slider3"), BundleImageSource(imageString: "slider4")]
        bannerView.slideshowInterval = 4.0
        bannerView.zoomEnabled = true
        bannerView.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 5))
        bannerView.backgroundColor = .red
        //bannerView.frame = self.frame
        bannerView.contentScaleMode = UIViewContentMode.scaleAspectFill
        bannerView.activityIndicator = DefaultActivityIndicator()
        bannerView.setImageInputs(localSource)
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = viewModelUser.arrUsers.data?.body?.count ?? 0
        return count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hCell = tableView.dequeueReusableCell(withIdentifier: "header")
        if section == 0 {
            hCell?.textLabel?.text = "\(viewModelUser.arrUsers.data?.banner?.title ?? "")".uppercased()
        }else{
            hCell?.textLabel?.text = "\(viewModelUser.arrUsers.data?.body?[section - 1].title ?? "")".uppercased()
        }
        hCell?.textLabel?.textColor = .darkGray

        
        return hCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if indexPath.section == 0 {
            cell.config(isBigCell: true, data: [], banner: viewModelUser.arrUsers.data?.banner?.list ?? [])
        }else{
            cell.config(isBigCell: false, data: viewModelUser.arrUsers.data?.body?[indexPath.section - 1].list ?? [], banner: [])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 380
        }else{
            return 310
        }
    }
}

