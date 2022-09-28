//
//  JasonViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/23/22.
//

import UIKit
import Alamofire

class JasonViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    

    var catergoryArry : [String] = []
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//fetch()
       parsingJdson()
    }
    
    func parsingJdson() {
        Alamofire.request("https://dummyjson.com/products/categories", method: .get).responseJSON { (response) in
            if let json = response.result.value {
                self.catergoryArry = json as! [String]
            }
            DispatchQueue.main.async {
                self.myTable.delegate = self
                self.myTable.dataSource = self
                self.myTable.reloadData()
            }
        }
    }
    
    
    func fetch() {
        let req = Alamofire.request("https://dummyjson.com/products/categories")
        
        req.responseJSON { (data) in
            print(data)
            
            
        }
    }
    
    func jasonUrl () {
        
        //Json Parser
      
        let session : URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        let request : URLRequest = {
            let url = URL (string: "https://jsonplaceholder.typicode.com/posts/1/comments")
            let request = URLRequest(url: url!)
            return request
        }()
        
        
        let dataTask = session.dataTask(with: request){ [self] (data, response, error) in
            
            if let _ = data{
                do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String : AnyObject]]
                                    
                    for eachJsonDict in json{
                        let emailStr = eachJsonDict["email"] as! String
                       // catergoryArry.add(emailStr)
                      //  let nameStr = eachJsonDict["name"] as! String
                      //    nameArr.add(nameStr)
                        
                    }
                    DispatchQueue.main.async {
                        self.myTable.delegate = self
                        self.myTable.dataSource = self
                        self.myTable.reloadData()
                    }
                
            }
            
         catch let error as NSError{
                print("Failed : \(error.localizedDescription)")
            }
            }
        }
        dataTask.resume()
        
        }
    
    
    
    func showCategory() {
      myTable.delegate = self
        myTable.dataSource = self
        
        guard let url = URL(string: "https://dummyjson.com/products/categories") else {
            return
        }
        
        Alamofire.request(url).responseJSON { (response) in
        guard let caty = response.value else {
               return
            }
        DispatchQueue.main.async {
                [weak self] in
                
               self?.myTable.reloadData()
            }
        }
        
      ///  Alamofire.request(url, method: .post, encoding:
      //   JSONEncoding.default, headers: nil).responseJSON {
       //   response in
         // switch response.result {
            //              case .success:
          //                 print(response)
           //                break
//
            //               case .failure(let error):
             //               print(error)
            //   }
         // }
        
        
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
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catergoryArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = catergoryArry[indexPath.row]
       let cell = self.myTable.dequeueReusableCell(withIdentifier: "Item1TableViewCell", for: indexPath) as! Item1TableViewCell
      //  cell.categoryLbl.text = item.T
            
        cell.categoryLbl.text = (item as AnyObject) as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90.0
    }
    
}

