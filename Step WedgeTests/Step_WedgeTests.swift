//
//  Step_WedgeTests.swift
//  Step WedgeTests
//
//  Created by Paul Willmott on 31/01/2026.
//

import Testing
import AppKit
@testable import Step_Wedge

struct Step_WedgeTests {

  @Test func testISOFilmSpeed() async throws {
    
    for isoSpeed in ISOFilmSpeed.allCases {
      #expect(ISOFilmSpeed.titles_forTest[isoSpeed] != nil)
    }
    
  }

  @Test func testFilmFormat() async throws {
    
    for filmFormat in FilmFormat.allCases {
      #expect(FilmFormat.titles_forTest[filmFormat] != nil)
    }
    
  }

  @Test func testDeveloper() async throws {
    
    for developer in Developer.allCases {
      #expect(Developer.titles_forTest[developer] != nil)
    }
    
  }

  @Test func testFilmStock() async throws {
    
    for filmStock in FilmStock.allCases {
      #expect(FilmStock.titles_forTest[filmStock] != nil)
    }
    
  }

  @Test func testDeveloperDilution() async throws {
    
    for dilution in DeveloperDilution.allCases {
      #expect(DeveloperDilution.titles_forTest[dilution] != nil)
    }
    
  }

  @Test func testSensitometerType() async throws {
    
    for type in SensitometerType.allCases {
      #expect(SensitometerType.titles_forTest[type] != nil)
    }
    
  }

  @Test func testFilmProcessingMethod() async throws {
    
    for method in FilmProcessingMethod.allCases {
      #expect(FilmProcessingMethod.titles_forTest[method] != nil)
    }
    
  }

  @Test func testStepIncrement() async throws {
    
    for increment in StepIncrement.allCases {
      #expect(StepIncrement.titles_forTest[increment] != nil)
    }
    
  }

  @Test func testResultSetType() async throws {
    
    for type in ResultSetType.allCases {
      #expect(ResultSetType.titles_forTest[type] != nil)
    }
    
  }

}
