//
//  ViewController.swift
//  CustomTextView
//
//  Created by 酒井恭平 on 2016/10/14.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var textView = CustomTextView(frame: .zero)
    private var sizeTextField = UITextField(frame: .zero)
    private var insetTextField = UITextField(frame: .zero)
    private var addTextField = UITextField(frame: .zero)
    
    private let width: CGFloat = 300
    private let textViewHeight: CGFloat = 300
    private let textFieldhHeight: CGFloat = 50
    private let buttonHeight: CGFloat = 50
    
    private var centerPositionX: CGFloat { return self.view.frame.width / 2}
    private var textViewBottom: CGFloat { return textView.frame.origin.y + textViewHeight }
    private var textFieldBottom: CGFloat { return textViewBottom + textFieldhHeight }
    
    private let textFieldPlaceholder = ["20", "12", "Hello,.."]
    private let textFieldKeyboardType: [UIKeyboardType] = [.numberPad, .numberPad, .default]
    
    private let buttonTitle = ["Change", "Change", "Add"]
    private let buttonSelector = [#selector(tapSizeButton(_:)), #selector(tapInsetButton(_:)), #selector(tapAddTextButton(_:))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextView()
        configureTextField()
        configureButton()
        
    }
    
    private func configureTextView() {
        textView.frame.size = CGSize(width: width, height: textViewHeight)
        textView.frame.origin = CGPoint(x: centerPositionX - width / 2, y: 100)
//        textView.text = "Fist text"
//        textView.textAlignment = .center
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.font = .systemFont(ofSize: 22.0)
        textView.keyboardAppearance = .dark
        
        textView.placeholder = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        textView.customDelegate = self
        textView.barItemTitle = "Hello"
//        textView.accessoryViewIsHidden = true
        textView.accessoryViewStyle = .blackOpaque
        textView.barItemTitleColor = UIColor.yellow
        textView.barItemTitleFont = UIFont.italicSystemFont(ofSize: 20)
//        textView.font = UIFont.italicSystemFont(ofSize: 30)
        
        view.addSubview(textView)
    }
    
    private func configureTextField() {
        let textFields = [sizeTextField, insetTextField, addTextField]
        for index in 0..<textFieldPlaceholder.count {
            let size = CGSize(width: width / 3, height: textFieldhHeight)
            let point = CGPoint(x: centerPositionX - width / 2 + size.width * CGFloat(index), y: textViewBottom)
            textFields[index].frame = CGRect(origin: point, size: size)
            textFields[index].placeholder = textFieldPlaceholder[index]
            textFields[index].keyboardType = textFieldKeyboardType[index]
            textFields[index].textAlignment = .center
            textFields[index].borderStyle = .line
            textFields[index].delegate = self
            view.addSubview(textFields[index])
        }
        
    }
    
    private func configureButton() {
        for index in 0..<buttonTitle.count {
            let size = CGSize(width: width / 3, height: buttonHeight)
            let point = CGPoint(x: centerPositionX - width / 2 + size.width * CGFloat(index), y: textFieldBottom)
            let button = UIButton(frame: CGRect(origin: point, size: size))
            button.setTitle(buttonTitle[index], for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
            button.addTarget(self, action: buttonSelector[index], for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    @objc private func tapSizeButton(_ sender: UIButton) {
        // textSizeを変更
        if let text = sizeTextField.text, let size = Int(text) {
            textView.font = .systemFont(ofSize: CGFloat(size))
        }
    }
    
    @objc private func tapInsetButton(_ sender: UIButton) {
        // textContainerInsetを変更
        if let text = insetTextField.text, let top = Int(text) {
            textView.textContainerInset.top = CGFloat(top)
            textView.textContainerInset.left = CGFloat(top)
            textView.textContainerInset.right = CGFloat(top)
        }
    }
    
    @objc private func tapAddTextButton(_ sender: UIButton) {
        // textを追加
        if let text = addTextField.text {
            textView.text = textView.text + text
        }
    }
    
}


// MARK: - delegate methods

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension ViewController: CustomTextViewDelegate {
    
    func customTextViewShouldDone(_ textView: CustomTextView) -> Bool {
//        print("Delegate->customTextViewShouldDone")
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
//        print("Delegate->customTextViewDidChange")
    }
    
}







