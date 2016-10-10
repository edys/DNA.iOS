//
//  BindingPlaceHolder.swift
//  DNA
//
//  Created by DATACOM on 10/10/16.
//  Copyright © 2016 DATACOM. All rights reserved.
//

import UIKit

class BindingPlaceHolder : PlaceHolder
{
    var value:BindingProtocol?
    
    init() {
        super.init(placeHolderType: .Binding)
    }
}
