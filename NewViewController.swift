//
//  NewViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/23/22.
//

import UIKit
import Alamofire

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jsonApiCall()
    }
    
    func jsonApiCall () {
        
        Alamofire.request("https://dummyjson.com/products/category/smartphones", method: .post, encoding:  URLEncoding.default, headers:  nil).responseJSON {
            response in
            switch response.result {
            case .success:
                if let dictSucess: NSDictionary = response.value as! NSDictionary? {
                    print(dictSucess)
                }
                break
            case .failure(let error) :
                print(error)
            }
        }
    }


}
