// -----------------------------------------------------------------------------
// FilmStock.swift
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
//     15/03/2026  Paul Willmott - FilmStock.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum FilmStock : UInt16, CaseIterable {
  
  // MARK: Enumeration
  
  case kodakTMAX100   = 1
  case kodakTRIX400   = 2
  case ilfordPANFPlus = 3
  case ilfordFP4Plus  = 4
  case ilfordHP5plus  = 5
  case ilfordSFX200   = 6
  case unknown        = 0

  // MARK: Constructors
  
  init?(title:String) {
    for temp in FilmStock.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return FilmStock.titles[self]!
  }
  
  // MARK: Private Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [FilmStock:String] {
    return titles
  }
  
#endif // DEBUG

  private static let titles : [FilmStock:String] = [
    .kodakTMAX100   : String(localized: "Kodak TMAX 100"),
    .kodakTRIX400   : String(localized: "Kodak TRI-X 400"),
    .ilfordFP4Plus  : String(localized: "Ilford FP4 PLUS"),
    .ilfordHP5plus  : String(localized: "Ilford HP5 PLUS"),
    .ilfordPANFPlus : String(localized: "Ilford PANF PLUS"),
    .ilfordSFX200   : String(localized: "Ilford SFX 200"),
    .unknown        : String(localized: "Unknown"),
  ]
  
  // MARK: Public Class Methods
  
  public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in FilmStock.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }
  
  public static func select(comboBox:NSComboBox, item:FilmStock) {
    comboBox.selectItem(withObjectValue: item.title)
  }
  
  public static func selected(comboBox:NSComboBox) -> FilmStock? {
    guard comboBox.indexOfSelectedItem != -1 else {
      return nil
    }
    return FilmStock(title: comboBox.objectValueOfSelectedItem as! String)
  }

}
