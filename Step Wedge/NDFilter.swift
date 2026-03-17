// -----------------------------------------------------------------------------
// NDFilter.swift
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
//     17/03/2026  Paul Willmott - NDFilter.swift created
// -----------------------------------------------------------------------------

import Foundation

public enum NDFilter : Int16, CaseIterable {
  
  // MARK: Enumeration
  
  case nd0_0 = 0
  case nd0_1 = 1
  case nd0_2 = 2
  case nd0_3 = 3
  case nd0_6 = 6
  case nd0_9 = 9
  
// MARK: Public Properties
  
  public var title : String {
    return NDFilter.titles[self]!
  }

  public var opticalDensity : Double {
    return Double(self.rawValue) / 10.0
  }
  
  public var transmittance : Double {
    return pow(10.0, -1.0 * opticalDensity)
  }
  
  public var fStopReduction : Double {
    return opticalDensity / 0.3
  }
  
  // MARK: Public Class Properties
  
#if DEBUG
  
  public static var titles_forTest : [NDFilter:String] {
    return titles
  }
  
#endif // DEBUG

  // MARK: Private Class Properties

  private static let titles : [NDFilter:String] = [
    .nd0_0      : String(localized: "ND 0.0"),
    .nd0_1      : String(localized: "ND 0.1"),
    .nd0_2      : String(localized: "ND 0.2"),
    .nd0_3      : String(localized: "ND 0.3"),
    .nd0_6      : String(localized: "ND 0.6"),
    .nd0_9      : String(localized: "ND 0.9"),
  ]

}
