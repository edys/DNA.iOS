//
//  Setup.swift
//  DNA
//
//  Created by Rhys Walden on 8/10/16.
//  Copyright © 2016 DNA. All rights reserved.
//

import UIKit

class Setup: AnyObject {
    
    let factory:DNAFactoryProtocol = DNAFactory()

    func SetupViewModel()
    {
        factory.viewModelFactory.register(type: ViewModelType.Text.rawValue) { (data, factory) -> ViewModel in
            let viewModel = TextViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data:data["Hidden"] as! [String:Any])
            viewModel.text = data["Text"] as? String
            if let list = data["PlaceHolders"] as? [[String:Any]]
            {
                viewModel.placeHolders = factory.placeHolderFactory.generate(data: list)
            }
            
            return viewModel;
        }
        
        factory.viewModelFactory.register(type: ViewModelType.Image.rawValue) { (data, factory) -> ViewModel in
            let viewModel = ImageViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data:data["Hidden"] as! [String:Any])
            return viewModel;
        }
        
        factory.viewModelFactory.register(type: ViewModelType.CompactSelect.rawValue) { (data, factory) -> ViewModel in
            let viewModel = CompactSelectViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data:data["Hidden"] as! [String:Any])
            viewModel.modelKey = data["ModelKey"] as? String
            viewModel.selectedId = data["SelectedId"] as? Int
            
            if let list = data["Validations"] as? [[String:Any]]
            {
                viewModel.validations = factory.valdationFactory.generate(data:list)
            }
            
            if let list = data["SelctionValues"] as? [[String:Any]]
            {
                viewModel.selctionValues = factory.viewModelFactory.generate(data: list) as! [CompactSelectValueViewModel]
            }
            return viewModel;
        }
        
        factory.viewModelFactory.register(type: ViewModelType.CompactSelectValue.rawValue) { (data, factory) -> ViewModel in
            let viewModel = CompactSelectValueViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data:data["Hidden"] as! [String:Any])
            viewModel.extraData = data["ExtraData"] as? [String:String]
            viewModel.id  = data["Id"] as? String
            viewModel.text = data["Text"] as? String
            viewModel.subText = data["SubText"] as? String
            return viewModel;
        }
    }
    
    func SetupPlaceHolder()
    {
        factory.placeHolderFactory.register(type: PlaceHolderType.Text.rawValue) { (data, factory) -> PlaceHolderProtocol in
            let placeHolder = TextPlaceHolder();
            placeHolder.value = data["Value"] as? String
            placeHolder.placeHolder = data["PlaceHolder"] as? String
            //placeHolder.textStyle =
            return placeHolder;
        }
        
        factory.placeHolderFactory.register(type: PlaceHolderType.Binding.rawValue) { (data, factory) -> PlaceHolderProtocol in
            let placeHolder = BindingPlaceHolder();
            placeHolder.value = try? factory.bindingFactory.generate(data: data["Value"] as! [String:Any])
            placeHolder.placeHolder = data["PlaceHolder"] as? String
            //placeHolder.textStyle =
            return placeHolder;
        }
    }
    
    func SetupValidation()
    {
        factory.valdationFactory.register(type: ValidationType.Length.rawValue) { (data, factory) -> ValidationProtocol in
            let validation = LengthValidation();
            
            validation.max = data["Max"] as? Int
            validation.min = data["Min"] as? Int
            
            return validation;
        }
        
        factory.valdationFactory.register(type: ValidationType.Required.rawValue) { (data, factory) -> ValidationProtocol in
            return RequiredValidation()
        }
    }
}





















