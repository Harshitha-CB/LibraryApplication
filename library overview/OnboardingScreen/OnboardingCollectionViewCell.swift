//
//  OnboardingCollectionViewCell.swift
//  library overview
//
//  Created by cdp on 16/05/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var slideTitle: UILabel!
    
    @IBOutlet weak var slideDescription: UILabel!
    
    func setup( slide : OnboardingSlide) {
        slideImage.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
        
        
        
    }
    
}
