//
//  ProductTVCell.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 11/06/23.
//

import UIKit

class ProductTVCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productDiscriptionLbl: UILabel!
    @IBOutlet weak var productRatingBtn: UIButton!
    @IBOutlet weak var productCategoryLbl: UILabel!
    var product : ProductModel?{
        didSet {
            productDetailCnfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productDetailCnfiguration(){
        guard let product else {
            return
        }
        productNameLbl.text = product.title
        priceLbl.text = String(product.price)
        productDiscriptionLbl.text = product.description
        productCategoryLbl.text = product.description
        productRatingBtn.setTitle("\(product.rating.rate)", for: .normal)
        productImgView.setImage(with: product.image)
    }
    
}
