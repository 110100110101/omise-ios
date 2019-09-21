//
//  AmounTextField.swift
//  OmiseSDK
//
//  Created by Jaja Yting on 21/09/2019.
//  Copyright © 2019 Omise. All rights reserved.
//

import Foundation

/**
 A type of textfield where the amount should be preferably put
 
 - Note: Formatting wasn't supported yet
 */
@objc(OMSAmountTextField) @IBDesignable
public class AmountTextField: OmiseTextField {
    
    // MARK: - Properties
    
    public override var delegate: UITextFieldDelegate? {
        
        get {
            return self
        }
        
        set {}
    }
    
    // MARK: - Fields
    
    fileprivate var illegalCharactersCharacterSet: CharacterSet!
    
    // MARK: - Initializers
    
    override public init() {
        super.init(frame: CGRect.zero)
        self.initializeInstance()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeInstance()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeInstance()
    }
    
    // MARK: - Public Methods
    
    public override func validate() throws {
        try super.validate()
        
        // TODO: Remove the statements below, once the regex has been applied
        
        guard let text = self.text else {
            throw OmiseTextFieldValidationError.emptyText
        }
        
        if text.isEmpty {
            throw OmiseTextFieldValidationError.emptyText
        }
        
        let intendedValue = Double(text)
        if intendedValue == nil {
            throw OmiseTextFieldValidationError.invalidData
        }
    }
    
    // MARK: - Private Methods
    
    private func initializeInstance() {
        
        super.delegate = self
        
        let decimalCharacterSet = CharacterSet.decimalDigits
        let decimalPointCharacterSet = CharacterSet(charactersIn: ".")
        self.illegalCharactersCharacterSet = decimalCharacterSet.union(decimalPointCharacterSet).inverted
        
        // TODO: Support Regex
    }
}

extension AmountTextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Deletion of texts
        if string.count == 0 {
            return true
        }
        
        let currentText = (textField.text ?? "") as NSString
        let intendedString = currentText.replacingCharacters(in: range, with: string)
        let intendedValue = Double(intendedString)
        
        return intendedValue != nil
    }
}
