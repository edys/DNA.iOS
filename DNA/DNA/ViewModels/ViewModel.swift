//
//  ViewModel.swift
//  DNA
//
//  Created by Rhys Walden on 24/09/16.
//  Copyright © 2016 DNA. All rights reserved.
//

import UIKit

enum PlaceHolderType :Int
{
    case Text = 0
    case Binding = 1
}

class ViewModel
{
    var viewModelType: ViewModelType
    var hidden:BindingProtocol?
    
    init(viewModelType:ViewModelType) {
        self.viewModelType = viewModelType
    }
}

protocol PlaceHolderProtocol {
    
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
    var placeHolders:[TextPlaceHolder]?
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

class PlaceHolder : PlaceHolderProtocol
{
    var placeHolderType:PlaceHolderType
    var placeHolder:String?
    var textStyle:TextStyle?
    
    init(placeHolderType:PlaceHolderType) {
        self.placeHolderType = placeHolderType
    }
    
}

class TextPlaceHolder : PlaceHolder
{
    var value:String?
    
    init() {
        super.init(placeHolderType: .Text)
    }
}

class BindingPlaceHolder : PlaceHolder
{
    var value:BindingProtocol?
    
    init() {
        super.init(placeHolderType: .Binding)
    }
}

class EditableViewModel: ViewModel
{
    var modelKey:String?
    var validations:[ValidationProtocol]?
    
    override init(viewModelType:ViewModelType) {
        super.init(viewModelType: viewModelType)
    }
}




