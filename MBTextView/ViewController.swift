//
//  ViewController.swift
//  MBTextView
//
//  Created by Nguyen Minh on 4/19/17.
//  Copyright © 2017 Nguyen Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var linkTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let linkAttributes: [String : Any] = [
            NSForegroundColorAttributeName: UIColor.blue,
            NSUnderlineColorAttributeName: UIColor.blue,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        linkTextView.linkTextAttributes = linkAttributes

        linkTextView.attributedText = self.getAttributedString()
        linkTextView.delegate = self
        linkTextView.isUserInteractionEnabled = true
        linkTextView.isSelectable = true
        linkTextView.isEditable = false
    }

    func getAttributedString() -> NSMutableAttributedString {
        let title = "This is a "
        let termCondition = "HomePage"
        let urlLink = "https://www.google.com.vn/"

        let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 21, weight: UIFontWeightRegular),
                     NSForegroundColorAttributeName: UIColor.black]
        let str = NSMutableAttributedString(string: title + termCondition, attributes:attrs)

        let foundRange = str.mutableString.range(of: termCondition)
        if foundRange.location != NSNotFound {
            str.addAttribute(NSLinkAttributeName, value: urlLink, range: foundRange)
        }
        return str
    }

    // MARK: - TextView Delegate

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return true
    }

    @available(iOS 10.0, *)
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        return true
    }
}

