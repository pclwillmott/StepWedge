// -----------------------------------------------------------------------------
// StepIncrement.swift
// Step Wedge
//
// Copyright © 2026 Paul C. L. Willmott. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the “Software”), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
// SOFTWARE.
// -----------------------------------------------------------------------------
//
// Revision History:
//
//     15/03/2026  Paul Willmott - StepIncrement.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum StepIncrement : UInt16, CaseIterable {
  
  // MARK: Enumeration
  
  case oneStop      = 0
  case oneThirdStop = 1
  case oneHalfStop  = 2

  // MARK: Constructors
  
  init?(title:String) {
    for temp in StepIncrement.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return StepIncrement.titles[self]!
  }
  
  // MARK: Private Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [StepIncrement:String] {
    return titles
  }
  
#endif // DEBUG

  private static let titles : [StepIncrement:String] = [
    .oneStop      : String(localized: "1 Stop"),
    .oneHalfStop  : String(localized: "½ Stop"),
    .oneThirdStop : String(localized: "⅓ Stop"),
  ]
  
  // MARK: Public Class Methods
  
  public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in StepIncrement.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }
  
  public static func select(comboBox:NSComboBox, item:StepIncrement) {
    comboBox.selectItem(withObjectValue: item.title)
  }
  
  public static func selected(comboBox:NSComboBox) -> StepIncrement? {
    guard comboBox.indexOfSelectedItem != -1 else {
      return nil
    }
    return StepIncrement(title: comboBox.objectValueOfSelectedItem as! String)
  }

}
