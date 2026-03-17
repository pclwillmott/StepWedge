// -----------------------------------------------------------------------------
// ShutterSpeed.swift
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
//     17/03/2026  Paul Willmott - ShutterSpeed.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum ShutterSpeed : Int16, CaseIterable {
  
  // MARK: Enumeration
  
  case s1      = 0
  case s1_2    = -1
  case s1_4    = -2
  case s1_8    = -3
  case s1_15   = -4
  case s1_30   = -5
  case s1_60   = -6
  case s1_125  = -7
  case s1_250  = -8
  case s1_500  = -9
  case s1_1000 = -10
  case s1_2000 = -11

// MARK: Public Properties
  
  public var title : String {
    return ShutterSpeed.titles[self]!
  }

  public var actualShutterSpeed : Double {
    return pow(2.0,Double(self.rawValue))
  }
  
  // MARK: Public Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [ShutterSpeed:String] {
    return titles
  }
  
#endif // DEBUG

  // MARK: Private Class Properties

  private static let titles : [ShutterSpeed:String] = [
    .s1      : String(localized: "1"),
    .s1_2    : String(localized: "1/2"),
    .s1_4    : String(localized: "1/4"),
    .s1_8    : String(localized: "1/8"),
    .s1_15   : String(localized: "1/15"),
    .s1_30   : String(localized: "1/30"),
    .s1_60   : String(localized: "1/60"),
    .s1_125  : String(localized: "1/125"),
    .s1_250  : String(localized: "1/250"),
    .s1_500   : String(localized: "1/500"),
    .s1_1000 : String(localized: "1/1000"),
    .s1_2000 : String(localized: "1/2000"),
  ]

}
