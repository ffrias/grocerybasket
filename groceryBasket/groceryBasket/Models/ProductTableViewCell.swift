//
//  ProductTableViewCell.swift
//  groceryBasket
//
//  Created by Federico Frias on 22/11/2018.
//  Copyright © 2018 ffrias. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var numberOfBasketsLabel: UILabel!
    @IBOutlet weak var productTotalsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(product: Product){
        if let productName = product.name{
                productNameLabel.text = "Product: \(productName)"
        }
        
        
        if let numberOfBaskets = product.baskets?.count{
            numberOfBasketsLabel.text = "Number of Baskets sold: \(numberOfBaskets)"
        }
        
        if let productsTotals = product.baskets?.reduce(0, +){
            productTotalsLabel.text = "Total of \(product.name!) sold: \(productsTotals)"
        }
        
    }
    
    override func prepareForReuse() {
        productNameLabel.text = nil
        numberOfBasketsLabel.text = nil
        productTotalsLabel.text = nil
    }

}
