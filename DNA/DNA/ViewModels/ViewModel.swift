//
//  ViewModel.swift
//  DNA
//
//  Created by Rhys Walden on 24/09/16.
//  Copyright © 2016 DNA. All rights reserved.
//

import UIKit

class ViewModel
{
    var viewModelType: ViewModelType
    var hidden:BindingProtocol?
    
    init(viewModelType:ViewModelType) {
        self.viewModelType = viewModelType
    }
}

class DisplayViewModel : ViewModel
{
    override init(viewModelType:ViewModelType) {
        super.init(viewModelType: viewModelType)
    }
}

class ImageViewModel : DisplayViewModel
{
    init() {
        super.init(viewModelType: .Image)
    }
}

class TextViewModel: DisplayViewModel
{
    var text:String?
    var placeHolders:[PlaceHolderProtocol]?
    var textStyle:TextStyle?
    
    init() {
        super.init(viewModelType: .Text)
    }
}

enum TextFont
{
     case Default
}

enum TextColour
{
    case Default
}

class TextStyle
{
    var font:TextFont = .Default
    var textColour:TextColour = .Default
    var bold:Bool = false
    var underlined:Bool = false
}

class EditableViewModel: ViewModel
{
    var modelKey:String?
    var validations:[ValidationProtocol]?
    
    override init(viewModelType:ViewModelType) {
        super.init(viewModelType: viewModelType)
    }
}
