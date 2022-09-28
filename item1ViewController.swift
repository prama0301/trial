//
//  item1ViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/21/22.
//

import UIKit
import Alamofire


class item1ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var catergoryArry: [Category] = []
   

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//jsonApiCall()
        showCategory()
        // Do any additional setup after loading the view.
       
    }
    
    func jsonApiCall () {
        
        Alamofire.request("https://dummyjson.com/products/categories", method: .post, encoding:  URLEncoding.default, headers:  nil).responseJSON { response in
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

    func showCategory() {
        myTable.delegate = self
        myTable.dataSource = self
        
        guard let url = URL(string: "https://dummyjson.com/products/categories") else {
            return
        }
        
     //   Alamofire.request(url).responseJSON { (response) in
    //        guard let caty = response.value else {
     //           return
     //       }
       //     DispatchQueue.main.async {
       //         [weak self] in
                
        //        self?.myTable.reloadData()
        //    }
      //  }
        
        Alamofire.request(url, method: .post, encoding:
         JSONEncoding.default, headers: nil).responseJSON {
          response in
          switch response.result {
                          case .success:
                           print(response)
                           break

                           case .failure(let error):
                            print(error)
               }
          }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catergoryArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = self.myTable.dequeueReusableCell(withIdentifier: "Item1TableViewCell", for: indexPath) as! Item1TableViewCell
       
          
        cell.categoryLbl.text = (catergoryArry[indexPath.row] as AnyObject) as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90.0
    }
    
}


