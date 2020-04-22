//
//  LottieView.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit

class Lottie: UIView {
    
    struct Constants {
        static let xibName = "Lottie"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    private func loadViewFromNib() {
        let bundle = Bundle.init(for: Lottie.self)
        if let viewsToAdd = bundle.loadNibNamed(Constants.xibName, owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }

}
