//
//  ImageTableViewCell.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/25/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var prdImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
    extension UIImageView {
        func loadImg(urlAdd: String) {
            guard let url = URL(string: urlAdd) else {
                return
            }
            DispatchQueue.main.async {
                [weak self] in
                if  let imageData = try? Data(contentsOf: url){
                    if let imageLoad = UIImage(data: imageData) {
                        self?.image = imageLoad
                    }
                }
            }
        }
        
    }

