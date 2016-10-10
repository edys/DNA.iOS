//
//  CompactSelectViewModel.swift
//  DNA
//
//  Created by Rhys Walden on 23/09/16.
//  Copyright © 2016 DNA. All rights reserved.
//

class CompactSelectViewModel: EditableViewModel {
    
    var selctionValues:[CompactSelectValueViewModel] = [CompactSelectValueViewModel]()
    var selectedId:Int?
    
    
    init() {
        super.init(viewModelType: .CompactSelect)
    }
}

class CompactSelectValueViewModel: DisplayViewModel
{
    var id:String?
    var text:String?
    var subText:String?
    
    var extraData:[String:String]?
    
    init() {
        super.init(viewModelType: .CompactSelectValue)
    }
}

