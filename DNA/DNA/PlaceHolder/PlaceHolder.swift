//
//  PlaceHolder.swift
//  DNA
//
//  Created by DATACOM on 10/10/16.
//  Copyright © 2016 DATACOM. All rights reserved.
//

import UIKit

class PlaceHolder : PlaceHolderProtocol
{
    var placeHolderType:PlaceHolderType
    var placeHolder:String?
    var textStyle:TextStyle?
    
    init(placeHolderType:PlaceHolderType) {
        self.placeHolderType = placeHolderType
    }
}
