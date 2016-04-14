//
//  GrayLineView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/21.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class GrayLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.minX, y: frame.minY, width: ScreenWidth, height: 1))
        self.backgroundColor = GrayColor_E2E2E2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
