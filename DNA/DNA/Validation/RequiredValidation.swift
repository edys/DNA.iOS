//
//  RequiredValidation.swift
//  DNA
//
//  Created by DATACOM on 10/10/16.
//  Copyright © 2016 DATACOM. All rights reserved.
//

import UIKit


class Validation: ValidationProtocol
{
    let validationType: ValidationType
    
    init(validationType:ValidationType) {
        self.validationType = validationType
    }
}

class RequiredValidation: Validation  {
    init(){
        super.init(validationType: .Required)
    }
}

class LengthValidation: Validation {
    
    var max:Int?
    var min:Int?
    
    init(){
        super.init(validationType: .Length)
    }
}
