//
//  UserViewModel.swift
//  MT
//
//  Created by Reshma on 16/02/21.
//

import UIKit
import Alamofire


class ListViewModel{
    
    weak var vc: ViewController?
    var arrUsers = ListModel()
    let baseUrl = "https://dev.dreamkatcher.com/api/v1/discover"
    func getAllUsreDataAF(){
        AF.request(baseUrl).response { [self] response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode(ListModel.self, from: data)
                    self.arrUsers = userResponse
                    DispatchQueue.main.async{
                        self.vc?.tableView.reloadData()
                        self.vc?.configerForBanner(array: self.arrUsers.data?.banner?.list ?? [BannerList]())
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
}
