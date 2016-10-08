//
//  Setup.swift
//  Helix
//
//  Created by Rhys Walden on 8/10/16.
//  Copyright © 2016 Helix. All rights reserved.
//

import UIKit

class Setup: AnyObject {
    
    func SetupViewModel()
    {
        let factory:HelixFactoryProtocol = HelixFactory()
        
        factory.viewModelFactory.register(type: ViewModelType.Text.rawValue) { (data, factory) -> ViewModel in
            let viewModel = TextViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data["Hidden"] as! [String:Any])
            viewModel.text = data["Text"] as? String
            return viewModel;
        }
        
        factory.viewModelFactory.register(type: ViewModelType.Image.rawValue) { (data, factory) -> ViewModel in
            let viewModel = ImageViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data["Hidden"] as! [String:Any])
            return viewModel;
        }
        
        factory.viewModelFactory.register(type: ViewModelType.CompactSelect.rawValue) { (data, factory) -> ViewModel in
            let viewModel = CompactSelectViewModel();
            viewModel.hidden = try? factory.bindingFactory.generate(data["Hidden"] as! [String:Any])
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
            viewModel.hidden = try? factory.bindingFactory.generate(data["Hidden"] as! [String:Any])
            viewModel.extraData = data["ExtraData"] as? [String:String]
            viewModel.id  = data["Id"] as? String
            viewModel.text = data["Text"] as? String
            viewModel.subText = data["SubText"] as? String
            return viewModel;
        }
    }
}
