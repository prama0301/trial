//
//  FinalViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/23/22.
//

import UIKit
import Alamofire

class FinalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //   Alamofire.request( "https://dummyjson.com/products/categories", method: .post).response { response in
         //   debugPrint(response)
        fetch()
        }
        
        func fetch() {
            let req = Alamofire.request("https://dummyjson.com/products/categories")
            
            req.responseJSON { (data) in
                print(data)
            }
        }
    }
    

   

