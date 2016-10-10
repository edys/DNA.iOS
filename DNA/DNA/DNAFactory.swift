//
//  DNAFactory.swift
//  DNA
//
//  Created by Rhys Walden on 8/10/16.
//  Copyright © 2016 DNA. All rights reserved.
//

import UIKit

protocol DNAFactoryProtocol {
    var viewModelFactory:Factory<ViewModel> { get }
    var bindingFactory:Factory<BindingProtocol> { get }
    var valdationFactory:Factory<ValidationProtocol> {get}
    var placeHolderFactory:Factory<PlaceHolderProtocol> {get}
}

class DNAFactory: AnyObject, DNAFactoryProtocol {
        
    lazy var viewModelFactory: Factory<ViewModel> = { [unowned self] in Factory<ViewModel>(DNAFactory: self, typeId: "ViewModelType")}()
    
    lazy var bindingFactory: Factory<BindingProtocol> = { [unowned self] in Factory<BindingProtocol>(DNAFactory: self, typeId: "BindingType")}()

    lazy var valdationFactory: Factory<ValidationProtocol> = { [unowned self] in Factory<ValidationProtocol>(DNAFactory: self, typeId: "ValdationType")}()
    
    lazy var placeHolderFactory: Factory<PlaceHolderProtocol> = { [unowned self] in Factory<PlaceHolderProtocol>(DNAFactory: self, typeId: "PlaceHolderType")}()

}

class Factory<Type>
{
    typealias CreateClosure = (_ data:[String:Any], _ factory:DNAFactoryProtocol) -> Type
    
    private let DNAFactory:DNAFactoryProtocol
    
    private var registerions:[Int:CreateClosure] = [Int:CreateClosure]()
    
    private let typeId:String
    
    init(DNAFactory:DNAFactoryProtocol, typeId:String) {
        self.DNAFactory = DNAFactory
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
                return createClosure(data, self.DNAFactory);
            }
        }
        
        throw DNAErrors.CreationError
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
