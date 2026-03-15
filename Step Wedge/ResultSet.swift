// -----------------------------------------------------------------------------
// ResultSet.swift
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
//     15/03/2026  Paul Willmott - ResultSet.swift created
// -----------------------------------------------------------------------------

import Foundation

public class ResultSet : NSObject {
 
  // MARK: Constructors
  
  public init(stepNumber:UInt) {
  
    self.stepNumber = stepNumber
    
    super.init()
    
  }
  
  // MARK: Private Properties
  
  // MARK: Public Properties

  public var stepNumber : UInt
  
  public var density : Double = 0.0
  
  public var illuminance : Double = 0.0
  
  public var exposureTime : Double = 0.0
  
  public var aperture : Double = 0.0
  
  public var shutterSpeed : Double = 0.0
  
  public var isMeteredSample : Bool = false
  
}
