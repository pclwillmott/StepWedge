// -----------------------------------------------------------------------------
// Aperture.swift
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
//     17/03/2026  Paul Willmott - Aperture.swift created
// -----------------------------------------------------------------------------

import Foundation
import AppKit

public enum Aperture : Int16, CaseIterable {
  
  // MARK: Enumeration
  
  case f0_7 = -3
  case f0_8 = -2
  case f0_9 = -1
  case f1_0 = 0
  case f1_1 = 1
  case f1_2 = 2
  case f1_4 = 3
  case f1_6 = 4
  case f1_8 = 5
  case f2   = 6
  case f2_2 = 7
  case f2_5 = 8
  case f2_8 = 9
  case f3_2 = 10
  case f3_5 = 11
  case f4   = 12
  case f4_5 = 13
  case f5_0 = 14
  case f5_6 = 15
  case f6_3 = 16
  case f7_1 = 17
  case f8   = 18
  case f9   = 19
  case f10  = 20
  case f11  = 21
  case f13  = 22
  case f14  = 23
  case f16  = 24
  case f18  = 25
  case f20  = 26
  case f22  = 27
  case f25  = 28
  case f29  = 29
  case f32  = 30
  case f36  = 31
  case f40  = 32
  case f45  = 33
  case f51  = 34
  case f57  = 35
  case f64  = 36
  case f72  = 37
  case f80  = 38
  case f90  = 39
  
  // MARK: Public Properties
    
  public var title : String {
    return Aperture.titles[self]!
  }

  public var actualAperture : Double {
    let AV = Double(self.rawValue) / 3.0
    return sqrt(pow(2.0,AV))
  }

    // MARK: Private Class Properties
    
  #if DEBUG
    
    public static var titles_forTest : [Aperture:String] {
      return titles
    }
    
  #endif // DEBUG

  private static let titles : [Aperture:String] = [
    .f0_7 : String(localized: "F0.7"),
    .f0_8 : String(localized: "F0.8"),
    .f0_9 : String(localized: "F0.9"),
    .f1_0 : String(localized: "F1.0"),
    .f1_1 : String(localized: "F1.1"),
    .f1_2 : String(localized: "F1.2"),
    .f1_4 : String(localized: "F1.4"),
    .f1_6 : String(localized: "F1.6"),
    .f1_8 : String(localized: "F1.8"),
    .f2   : String(localized: "F2"),
    .f2_2 : String(localized: "F2.2"),
    .f2_5 : String(localized: "F2.5"),
    .f2_8 : String(localized: "F2.8"),
    .f3_2 : String(localized: "F3.2"),
    .f3_5 : String(localized: "F3.5"),
    .f4   : String(localized: "F4"),
    .f4_5 : String(localized: "F4.5"),
    .f5_0 : String(localized: "F5"),
    .f5_6 : String(localized: "F5.6"),
    .f6_3 : String(localized: "F6.3"),
    .f7_1 : String(localized: "F7.1"),
    .f8   : String(localized: "F8"),
    .f9   : String(localized: "F9"),
    .f10  : String(localized: "F10"),
    .f11  : String(localized: "F11"),
    .f13  : String(localized: "F13"),
    .f14  : String(localized: "F14"),
    .f16  : String(localized: "F16"),
    .f18  : String(localized: "F18"),
    .f20  : String(localized: "F20"),
    .f22  : String(localized: "F22"),
    .f25  : String(localized: "F25"),
    .f29  : String(localized: "F29"),
    .f32  : String(localized: "F32"),
    .f36  : String(localized: "F36"),
    .f40  : String(localized: "F40"),
    .f45  : String(localized: "F45"),
    .f51  : String(localized: "F51"),
    .f57  : String(localized: "F57"),
    .f64  : String(localized: "F64"),
    .f72  : String(localized: "F72"),
    .f80  : String(localized: "F80"),
    .f90  : String(localized: "F90"),
  ]

}
