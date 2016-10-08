//
//  HelixFactory.swift
//  Helix
//
//  Created by Rhys Walden on 8/10/16.
//  Copyright © 2016 Helix. All rights reserved.
//

import UIKit

protocol HelixFactoryProtocol {
    var viewModelFactory:Factory<ViewModel> { get }
    var bindingFactory:Factory<BindingProtocol> { get }
    var valdationFactory:Factory<ValidationProtocol> {get}
}

class HelixFactory: AnyObject, HelixFactoryProtocol {
    
    
    lazy var viewModelFactory: Factory<ViewModel> = { [unowned self] in Factory<ViewModel>(helixFactory: self, typeId: "ViewModelType")}()
    
    lazy var bindingFactory: Factory<BindingProtocol> = { [unowned self] in Factory<BindingProtocol>(helixFactory: self, typeId: "BindingType")}()

    
    lazy var valdationFactory: Factory<ValidationProtocol> = { [unowned self] in Factory<ValidationProtocol>(helixFactory: self, typeId: "ValdationType")}()
}

class Factory<Type>
{
    
    typealias CreateClosure = (_ data:[String:Any], _ factory:HelixFactoryProtocol) -> Type
    
    private let helixFactory:HelixFactoryProtocol
    
    private var registerions:[Int:CreateClosure] = [Int:CreateClosure]()
    
    private let typeId:String
    
    init(helixFactory:HelixFactoryProtocol, typeId:String) {
        self.helixFactory = helixFactory
        self.typeId = typeId
    }
    
    func register(type:Int, createViewModelClosure:@escaping CreateClosure)
    {
        registerions[type] = createViewModelClosure;
    }
    
    func generate(data:[String:Any]) throws -> Type
    {
        if let type = data[typeId] as? Int
        {
            if let createClosure = registerions[type]
            {
                return createClosure(data, self.helixFactory);
            }
        }
        
        throw HelixErrors.CreationError
    }
    
    func generate(data:[[String:Any]]) -> [Type]
    {
        var modelList = [Type]()
        for listItem in data
        {
            if let generateModel = try? generate(data: listItem)
            {
                modelList.append(generateModel);
            }
        }
        return modelList;
    }
}
