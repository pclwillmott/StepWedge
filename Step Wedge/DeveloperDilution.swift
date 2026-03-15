// -----------------------------------------------------------------------------
// DeveloperDilution.swift
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
//     15/03/2026  Paul Willmott - DeveloperDilution.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum DeveloperDilution : UInt16, CaseIterable {
  
  // MARK: Enumeration
  
  case ddStock  = 0
  case dd1to1   = 1
  case dd1to3   = 3
  case dd1to4   = 4
  case dd1to7   = 7
  case dd1to9   = 9
  case dd1to14  = 14
  case dd1to19  = 19
  case dd1to25  = 25
  case dd1to29  = 29
  case dd1to50  = 50

  // MARK: Constructors
  
  init?(title:String) {
    for temp in DeveloperDilution.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return DeveloperDilution.titles[self]!
  }
  
  // MARK: Public Methods
  
  public func amountOfStockSolution(totalFinalVolume:Double) -> Double {
    return totalFinalVolume / (Double(self.rawValue) + 1.0)
  }
  
  public func amountOfWater(totalFinalVolume:Double) -> Double {
    return totalFinalVolume - amountOfStockSolution(totalFinalVolume: totalFinalVolume)
  }
  
  // MARK: Private Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [DeveloperDilution:String] {
    return titles
  }
  
#endif // DEBUG

  private static let titles : [DeveloperDilution:String] = [
    .ddStock : String(localized: "Stock"),
    .dd1to1  : String(localized: "1:1"),
    .dd1to3  : String(localized: "1:3"),
    .dd1to4  : String(localized: "1:4"),
    .dd1to7  : String(localized: "1:7"),
    .dd1to9  : String(localized: "1:9"),
    .dd1to14 : String(localized: "1:14"),
    .dd1to19 : String(localized: "1:19"),
    .dd1to25 : String(localized: "1:25"),
    .dd1to29 : String(localized: "1:29"),
    .dd1to50 : String(localized: "1:50"),
  ]
  
  // MARK: Public Class Methods
  
  public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in DeveloperDilution.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }
  
  public static func select(comboBox:NSComboBox, item:DeveloperDilution) {
    comboBox.selectItem(withObjectValue: item.title)
  }
  
  public static func selected(comboBox:NSComboBox) -> DeveloperDilution? {
    guard comboBox.indexOfSelectedItem != -1 else {
      return nil
    }
    return DeveloperDilution(title: comboBox.objectValueOfSelectedItem as! String)
  }

}
