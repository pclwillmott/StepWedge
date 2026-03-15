// -----------------------------------------------------------------------------
// ISOFilmSpeed.swift
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
//     15/03/2026  Paul Willmott - ISOFilmSpeed.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ISOFilmSpeed : UInt16, CaseIterable {
  
  // MARK: Enumeration
  
  case iso3200 = 3200
  case iso2500 = 2500
  case iso2000 = 2000
  case iso1600 = 1600
  case iso1250 = 1250
  case iso1000 = 1000
  case iso800  = 800
  case iso640  = 640
  case iso500  = 500
  case iso400  = 400
  case iso320  = 320
  case iso250  = 250
  case iso200  = 200
  case iso160  = 160
  case iso125  = 125
  case iso100  = 100
  case iso80   = 80
  case iso64   = 64
  case iso50   = 50
  case iso40   = 40
  case iso32   = 32
  case iso25   = 25
  case iso20   = 20
  case iso16   = 16
  case iso12   = 12
  
  // MARK: Constructors
  
  init?(title:String) {
    for temp in ISOFilmSpeed.allCases {
      if temp.title == title {
        self = temp
        return
      }
    }
    return nil
  }

  // MARK: Public Properties
  
  public var title : String {
    return ISOFilmSpeed.titles[self]!
  }
  
  // MARK: Private Class Properties
  
  private static let titles : [ISOFilmSpeed:String] = [
    .iso12 : String(localized: "ISO 12/12°"),
    .iso16 : String(localized: "ISO 16/13°"),
    .iso20 : String(localized: "ISO 20/14°"),
    .iso25 : String(localized: "ISO 25/15°"),
    .iso32 : String(localized: "ISO 32/16°"),
    .iso40 : String(localized: "ISO 40/17°"),
    .iso50 : String(localized: "ISO 50/18°"),
    .iso64 : String(localized: "ISO 64/19°"),
    .iso80 : String(localized: "ISO 80/20°"),
    .iso100 : String(localized: "ISO 100/21°"),
    .iso125 : String(localized: "ISO 125/22°"),
    .iso160 : String(localized: "ISO 160/23°"),
    .iso200 : String(localized: "ISO 200/24°"),
    .iso250 : String(localized: "ISO 250/25°"),
    .iso320 : String(localized: "ISO 320/26°"),
    .iso400 : String(localized: "ISO 400/27°"),
    .iso500 : String(localized: "ISO 500/28°"),
    .iso640 : String(localized: "ISO 640/29°"),
    .iso800 : String(localized: "ISO 800/30°"),
    .iso1000 : String(localized: "ISO 1000/31°"),
    .iso1250 : String(localized: "ISO 1250/32°"),
    .iso1600 : String(localized: "ISO 1600/33°"),
    .iso2000 : String(localized: "ISO 2000/34°"),
    .iso2500 : String(localized: "ISO 2500/35°"),
    .iso3200 : String(localized: "ISO 3200/36°"),
  ]
  
  // MARK: Public Class Methods
  
  public static func populate(comboBox:NSComboBox) {
    comboBox.removeAllItems()
    for item in ISOFilmSpeed.allCases {
      comboBox.addItem(withObjectValue: item.title)
    }
  }
  
  public static func select(comboBox:NSComboBox, item:ISOFilmSpeed) {
    comboBox.selectItem(withObjectValue: item.title)
  }
  
  public static func selected(comboBox:NSComboBox) -> ISOFilmSpeed? {
    guard comboBox.indexOfSelectedItem != -1 else {
      return nil
    }
    return ISOFilmSpeed(rawValue: UInt16(exactly: comboBox.indexOfSelectedItem)!)
  }

}
