// -----------------------------------------------------------------------------
// FilmProcessingMethod.swift
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
//     15/03/2026  Paul Willmott - FilmProcessingMethod.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum FilmProcessingMethod : UInt16, CaseIterable {
  
  // MARK: Enumeration
  
  case smallTank  = 1
  case largeTank  = 2
  case tray       = 3
  case rotaryTube = 4

  // MARK: Constructors
  
  init?(title:String) {
    for temp in FilmProcessingMethod.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return FilmProcessingMethod.titles[self]!
  }
  
  // MARK: Private Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [FilmProcessingMethod:String] {
    return titles
  }
  
#endif // DEBUG

  private static let titles : [FilmProcessingMethod:String] = [
    .smallTank  : String(localized: "Small Tank"),
    .largeTank  : String(localized: "Large Tank"),
    .tray       : String(localized: "Tray"),
    .rotaryTube : String(localized: "Rotary Tube"),
  ]
  
  // MARK: Public Class Methods
  
  public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in FilmProcessingMethod.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }
  
  public static func select(comboBox:NSComboBox, item:FilmProcessingMethod) {
    comboBox.selectItem(withObjectValue: item.title)
  }
  
  public static func selected(comboBox:NSComboBox) -> FilmProcessingMethod? {
    guard comboBox.indexOfSelectedItem != -1 else {
      return nil
    }
    return FilmProcessingMethod(title: comboBox.objectValueOfSelectedItem as! String)
  }

}
