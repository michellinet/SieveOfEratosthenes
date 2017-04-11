//
//  PrimeCollectionViewCell.swift
//  SieveOfTheEratosthenesVariety
//
//  Created by Michelline Tran on 4/6/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import Foundation
import UIKit

class PrimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var valueLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.backgroundColor = UIColor(colorLiteralRed: 118.0/255.0, green: 50.0/255.0, blue: 168.0/255.0, alpha: 0.67)
    }
}
