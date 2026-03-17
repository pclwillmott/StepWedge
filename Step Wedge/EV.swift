// -----------------------------------------------------------------------------
// EV.swift
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
//     17/03/2026  Paul Willmott - EV.swift created
// -----------------------------------------------------------------------------

import Foundation

public class EV : NSObject {
  
  // MARK: Constructors
  
  init(_aperture: Aperture, _shutterSpeed: ShutterSpeed, _filmSpeed: ISOFilmSpeed, _ndFilter:NDFilter) {
    self._aperture = _aperture
    self._shutterSpeed = _shutterSpeed
    self._filmSpeed = _filmSpeed
    self._ndFilter = _ndFilter
    super.init()
  }
  
  // MARK: Private Properties
  
  public var _aperture : Aperture
  
  public var _shutterSpeed : ShutterSpeed
  
  public var _filmSpeed : ISOFilmSpeed
  
  public var _ndFilter : NDFilter
  
  // MARK: Public Properties
  
  public var aperture : Aperture {
    
    get {
      return _aperture
    }
    
    set(value) {
      _aperture = value
    }
    
  }
  
  public var shutterSpeed : ShutterSpeed {
    
    get {
      return _shutterSpeed
    }
    
    set(value) {
      _shutterSpeed = value
    }
    
  }
  
  public var filmSpeed : ISOFilmSpeed {
    
    get {
      return _filmSpeed
    }
    
    set(value) {
      _filmSpeed = value
    }
    
  }
  
  public var ndFilter : NDFilter {
    
    get {
      return _ndFilter
    }
    
    set(value) {
      _ndFilter = value
    }
  }
  
  public var ev : Double {
    
    get {
      let a = _aperture.actualAperture
      let s = _shutterSpeed.actualShutterSpeed
      return log2(a * a / s) + log2(Double(_filmSpeed.rawValue) / 100.0) + _ndFilter.fStopReduction
    }
    
  }
  
  // MARK: Private Methods
  
  // MARK: Public Methods
  
  // MARK: Public Class Methods
  
  public class func ev(availableApertures:[Aperture], availableShutterSpeeds:[ShutterSpeed], availableNDFilters:[NDFilter]) -> [EV] {
    
    var combinations : [EV] = []
    
    var maxSpeed : ShutterSpeed?
    
    for speed in availableShutterSpeeds {
      if maxSpeed == nil {
        maxSpeed = speed
      }
      else if speed.actualShutterSpeed < maxSpeed!.actualShutterSpeed {
        maxSpeed = speed
      }
    }
    
    for speed in availableShutterSpeeds {
      for aperture in availableApertures {
        for ndFilter in availableNDFilters {
          let ok = ndFilter != .nd0_3 || speed == maxSpeed
          if ok {
            let ev = EV(_aperture: aperture, _shutterSpeed: speed, _filmSpeed: .iso100,_ndFilter: ndFilter)
            combinations.append(ev)
          }
        }
      }
    }
    
    combinations.sort {$0.ev < $1.ev}
    
    var index = 0
    
    var lastEV : EV?
    
    while index < combinations.count {
      if let lastEV, lastEV.ev == combinations[index].ev {
        combinations.remove(at: index)
      }
      else {
        lastEV = combinations[index]
        index += 1
      }
    }
    
    combinations.sort {$0.ndFilter.opticalDensity < $1.ndFilter.opticalDensity}
    
    return combinations
    
  }
  
}

public func apertures() {
  
  let availableApertures : [Aperture] = [.f4, .f5_6, .f8, .f11, .f16, .f22, .f32]
  
  let availableSpeeds : [ShutterSpeed] = [.s1_2, .s1_4, .s1_8, .s1_15, .s1_30, .s1_60, .s1_125, .s1_250, .s1_500, .s1_1000]
  
  let availableNDFilters : [NDFilter] = [.nd0_0, .nd0_1, .nd0_2, .nd0_3]
  
  let combinations = EV.ev(availableApertures: availableApertures, availableShutterSpeeds: availableSpeeds, availableNDFilters: availableNDFilters)
  
  for combo in combinations {
    print("EV:\(combo.ev) \(combo.shutterSpeed.title) \(combo.aperture.title) \(combo.ndFilter.title)")
  }
}
