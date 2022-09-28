//
//  ImageViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/25/22.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var diffProduct = [products]()
    @IBOutlet weak var prdTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
getDats()
        // Do any additional setup after loading the view.
    }
    
    func getDats() {
        Alamofire.request("https://dummyjson.com/products/category/smartphones", method: .get).responseJSON { (response) in
            if let jason = response.result.value {
                self.diffProduct = jason  as! [products]
                
            }
            DispatchQueue.main.async {
                self.prdTable.delegate = self
                self.prdTable.dataSource = self
                self.prdTable.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        diffProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = prdTable.dequeueReusableCell(withIdentifier: "ImageTable" , for: indexPath) as! ImageTableViewCell
        cell.titleLbl.text = diffProduct[indexPath.row].productTitle
        cell.descLbl.text = diffProduct[indexPath.row].productDescription
        cell.prdImage.loadImg(urlAdd: diffProduct[indexPath.row].productThumbnail)
        return cell
    }
}
