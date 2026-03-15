//
//  GraphPaperView.swift
//  Step Wedge
//
//  Created by Paul Willmott on 31/01/2026.
//

// https://github.com/paescebu/PolynomialRegressionSwift/blob/master/README.md


import Foundation
import AppKit

//@IBDesignable
class GraphPaperView: NSView {
  
  // MARK: Drawing Stuff
  
  override func draw(_ dirtyRect: NSRect) {
    
    let path = NSBezierPath()
    
    path.lineWidth = 0.25
    
    let color : NSColor = .black
    
    NSColor.setStrokeColor(color: color)
    
    NSColor.setFillColor(color: .white)
 
    let fontSize : CGFloat = 8
    
    let font = NSFont.systemFont(ofSize: fontSize)

    let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle

    let textFontAttributes = [
        NSAttributedString.Key.font: font,
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.paragraphStyle: textStyle
    ] as [NSAttributedString.Key : Any]

    let tick = CGFloat(3.50)

    let lowerBorder : CGFloat = 80.0
    
    let leftBorder : CGFloat = 23.0
    
    let leftBorderAdjust : CGFloat = 36.0
    
    let spacing : CGFloat = lowerBorder / 7.0
    
    let yHeight = CGFloat(38 * 5 * tick)
    
    /*
    for x in 0...150 {

      let size = x % 5 == 0 ? tick : tick / 2
      
      let xPos = leftBorderAdjust + leftBorder + CGFloat(x) * tick
      
      path.move(to: NSMakePoint(xPos, lowerBorder))
      path.line(to: NSMakePoint(xPos, lowerBorder + size))

      path.move(to: NSMakePoint(xPos, lowerBorder + 50 * tick))
      path.line(to: NSMakePoint(xPos, lowerBorder + 50 * tick + size))

      path.move(to: NSMakePoint(xPos, lowerBorder + 100 * tick))
      path.line(to: NSMakePoint(xPos, lowerBorder + 100 * tick + size))

      path.move(to: NSMakePoint(xPos, lowerBorder + 150 * tick))
      path.line(to: NSMakePoint(xPos, lowerBorder + 150 * tick + size))

      path.move(to: NSMakePoint(xPos, lowerBorder + yHeight))
      path.line(to: NSMakePoint(xPos, lowerBorder + yHeight - size))

    }

    for x in 0...20 {
      
      let xPos = leftBorderAdjust + leftBorder + CGFloat(x) * 7.5 * tick
      
      path.move(to: NSMakePoint(xPos, lowerBorder))
      path.line(to: NSMakePoint(xPos, lowerBorder + yHeight))

      if x % 2 == 0 {
        path.move(to: NSMakePoint(xPos, spacing))
        path.line(to: NSMakePoint(xPos, lowerBorder))
      }
      
      for y in 0...190 {
        
        let ypos = lowerBorder + CGFloat(y) * tick
        
        let size = y % 5 == 0 ? tick : tick / 2
        
        if x < 20 {
          path.move(to: NSMakePoint(xPos, ypos))
          path.line(to: NSMakePoint(xPos + size, ypos))
        }
        else {
          path.move(to: NSMakePoint(xPos - size, ypos))
          path.line(to: NSMakePoint(xPos, ypos))
        }

      }
      
    }
    
    for y in 0...19 {
      
      let yPos = lowerBorder + CGFloat(y) * 10 * tick
      
      path.move(to: NSMakePoint(leftBorderAdjust + leftBorder, yPos))
      path.line(to: NSMakePoint(leftBorderAdjust + leftBorder + 150 * tick, yPos))
      
      let text = "\(Double(y) * 2.0 / 10.0)"
      
      let textRect = CGRect(x: leftBorderAdjust + 21.0 * 7.5 * tick + 2 * tick, y: yPos - 14, width: 20.0, height:20.0)
      
      text.draw(in: textRect, withAttributes: textFontAttributes)

      let textRect2 = CGRect(x: leftBorderAdjust + 0, y: yPos - 14, width: 20.0, height:20.0)
      
      text.draw(in: textRect2, withAttributes: textFontAttributes)

    }
    
    let scales = ["A", "B", "C", "D", "E", ""]
    
    var index : CGFloat = 2
    
    for scale in scales {
      
      let textRect = CGRect(x: leftBorderAdjust + 0, y: lowerBorder - index * spacing, width: 20.0 , height:20.0)
      
      let text = scale
      
      text.draw(in: textRect, withAttributes: textFontAttributes)
      
      if !scale.isEmpty {
        
        let yPos = lowerBorder - (index - 0.8) * spacing
        
        path.move(to: NSMakePoint(leftBorderAdjust + leftBorder, yPos))
        path.line(to: NSMakePoint(leftBorderAdjust + leftBorder + 150 * tick, yPos))
        
      }
      
      index += 1
      
    }
    
    var xPos = leftBorderAdjust + leftBorder + 11 * 5 * tick
    
    for _ in 0...19 {
      
      path.move(to: NSMakePoint(xPos, spacing * 3.7))
      path.line(to: NSMakePoint(xPos, lowerBorder))
      
      xPos += 5 * tick
 
    }
    
    path.stroke()
    
    path.removeAllPoints()
        
    for x in 0...20 {
      
      let xPos = leftBorderAdjust + leftBorder + CGFloat(x) * 7.5 * tick
      
      let text = "\(21 - x)"
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: xPos - width / 2.0, y: lowerBorder - 1 * spacing, width: width , height:fontSize)
      
      NSColor.setFillColor(color: .white)
      
      textRect.fill()
      
      text.draw(in: textRect, withAttributes: textFontAttributes)
      
      let textRect2 = CGRect(x: xPos - width / 2.0, y: lowerBorder + 192 * tick, width: width , height:fontSize)
      
      NSColor.setFillColor(color: .white)
      
      textRect2.fill()
      
      text.draw(in: textRect2, withAttributes: textFontAttributes)
      
    }
    
    for x in 0...10 {
      
      let text = "\(11 - x)"
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: leftBorderAdjust + leftBorder + CGFloat(x) * 15 * tick - width / 2.0, y: lowerBorder - 2 * spacing, width: width , height:fontSize)
      
      NSColor.setFillColor(color: .white)
      
      textRect.fill()
      
      text.draw(in: textRect, withAttributes: textFontAttributes)
      
    }
  
    let titles = ["19", "18", "17", "B", "15", "14", "13", "12", "11", "10", "9", "8", "M", "6", "5", "4", "3", "2", "1", "A"]
    
    xPos = leftBorderAdjust + leftBorder + 11 * 5 * tick
    
    for ss in titles {
  
      let text = String(ss)
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: xPos - width / 2.0, y: lowerBorder - 3 * spacing, width: width , height:fontSize)
      
      NSColor.setFillColor(color: .white)
      
      textRect.fill()
      
      text.draw(in: textRect, withAttributes: textFontAttributes)

      xPos += 5 * tick
      
    }

    let titles2 = ["10", "", "", "9", "", "", "8", "", "", "7", "", "", "6", "", "5", "", "4", "3", "2", "1"]
    
    var xPos2 = leftBorderAdjust + leftBorder + 11 * 5 * tick
    
    for ss in titles2 {
      
      let text = String(ss)
      
      if !text.isEmpty {
        
        let width = widthInPoints(text: text, attributes: textFontAttributes)
        
        let textRect = CGRect(x: xPos2 - width / 2.0, y: lowerBorder - 4 * spacing, width: width , height:fontSize)
        
        NSColor.setFillColor(color: .white)
        
        textRect.fill()
        
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
      }
      
      xPos2 += 5 * tick
      
    }

    let titles3 = ["8", "7", "6", "5", "4", "3", "2", "1"]
    
    var xPos3 = leftBorderAdjust + leftBorder + 9 * 5 * tick
    
    for ss in titles3 {
      
      let text = String(ss)
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: xPos3 - width / 2.0, y: lowerBorder - 5 * spacing, width: width , height:fontSize)
      
      NSColor.setFillColor(color: .white)
      
      textRect.fill()

      text.draw(in: textRect, withAttributes: textFontAttributes)

      xPos3 += 15 * tick
      
    }
    
    for x in 0...10 {
 
      let text = "\(round(Double(x) * 0.3 * 10) / 10)"
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: leftBorderAdjust + leftBorder + CGFloat(x) * 15 * tick - width / 2.0, y: lowerBorder - 6 * spacing, width: width, height:fontSize)

      NSColor.setFillColor(color: .white)
      
      textRect.fill()

      text.draw(in: textRect, withAttributes: textFontAttributes)

    }
  
    let text = "Curve Plotting Graph Paper"
    
    let font2 = NSFont.systemFont(ofSize: 14)
    
    let textRect = CGRect(x: leftBorderAdjust + 60 * tick, y: CGFloat(194) * tick + lowerBorder, width: 300 , height:20.0)

    let textFontAttributes2 = [
        NSAttributedString.Key.font: font2,
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.paragraphStyle: textStyle
    ] as [NSAttributedString.Key : Any]
    
    text.draw(in: textRect, withAttributes: textFontAttributes2)

    var text3 = "No."
    
    let font3 = NSFont.systemFont(ofSize: 11)
    
    var xpos3 = leftBorderAdjust + leftBorder + 5 * tick
    
    let ypos3 = CGFloat(196) * tick + lowerBorder

    let textFontAttributes3 = [
        NSAttributedString.Key.font: font3,
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.paragraphStyle: textStyle
    ] as [NSAttributedString.Key : Any]
    
    var width = widthInPoints(text: text3, attributes: textFontAttributes3)
    
    let textRect3 = CGRect(x: xpos3, y: ypos3, width: width, height:11.0)

    text3.draw(in: textRect3, withAttributes: textFontAttributes3)

    path.removeAllPoints()

    path.move(to: NSMakePoint(xpos3 + width + 2 * tick, ypos3))
    path.line(to: NSMakePoint(xpos3 + width + 2 * tick + 60, ypos3))

    text3 = "Date"
    
    width = widthInPoints(text: text3, attributes: textFontAttributes3)
    
    xpos3 = leftBorderAdjust + leftBorder + 121 * tick
    
    let textRect4 = CGRect(x: xpos3, y: ypos3, width: width, height:11.0)

    text3.draw(in: textRect4, withAttributes: textFontAttributes3)

    path.move(to: NSMakePoint(xpos3 + width + 2 * tick, ypos3))
    path.line(to: NSMakePoint(xpos3 + width + 2 * tick + 60, ypos3))

    path.stroke()
    
    path.removeAllPoints()
    */
    path.lineWidth = 0.25
    
    // Step Wedge Extension Markers
  
    for index in 1 ... 21 {
      let x : CGFloat = CGFloat(index) * 72 * 5.48 / 25.4
      let y : CGFloat = 600
      
      path.move(to: NSMakePoint(x, y))
      path.line(to: NSMakePoint(x, y + 72 * 0.5))
      
      let text = "\(22 - index)"
      
      let width = widthInPoints(text: text, attributes: textFontAttributes)
      
      let textRect = CGRect(x: x - width / 2.0, y: y - 72 * 0.25, width: width, height:fontSize)

      text.draw(in: textRect, withAttributes: textFontAttributes)

    }
    
    /*
    path.move(to: NSMakePoint(36, 0))
    path.line(to: NSMakePoint(36, 33))

    path.move(to: NSMakePoint(36, 72 * 7.55))
    path.line(to: NSMakePoint(36, 72 * 8))

    path.move(to: NSMakePoint(72 * 8, 0))
    path.line(to: NSMakePoint(72 * 8, 33))

    path.move(to: NSMakePoint(72 * 8, 72 * 7.55))
    path.line(to: NSMakePoint(72 * 8, 72 * 8))

    path.move(to: NSMakePoint(0, 36))
    path.line(to: NSMakePoint(33, 36))

    path.move(to: NSMakePoint(0, 72 * 7.5))
    path.line(to: NSMakePoint(33, 72 * 7.5))

    path.move(to: NSMakePoint(72 * 8.1, 36))
    path.line(to: NSMakePoint(72 * 8.5, 36))

    path.move(to: NSMakePoint(72 * 8.1, 72 * 7.5))
    path.line(to: NSMakePoint(72 * 8.5, 72 * 7.5))
*/
    
    drawText(text: "CONTRAST INDEX GUAGE", xPos: 4 * 72, yPos: 6.9 * 72, fontSize: 14.0, isCentered: true)
    
    path.move(to: NSMakePoint(leftBorderAdjust + leftBorder, lowerBorder))

    let bfXPos : CGFloat = leftBorderAdjust + leftBorder + 19.5 * tick
    let bfYPos : CGFloat = lowerBorder
    
    path.line(to: NSMakePoint(bfXPos + 2.0 * tick, bfYPos))

    path.move(to: NSMakePoint(bfXPos, bfYPos - 2.0 * tick))
    path.line(to: NSMakePoint(bfXPos, bfYPos + 2.0 * tick))

    path.move(to: NSMakePoint(bfXPos + 0.2 * 50 * tick, bfYPos))
    path.line(to: NSMakePoint(bfXPos + 2.3 * 50 * tick, bfYPos))

    drawText(text: "BASE + FOG DENSITY", xPos: leftBorderAdjust + leftBorder + 6, yPos: bfYPos - 6, fontSize: 5.0)
    
    drawText(text: "LOG E = 2.0", xPos: leftBorderAdjust + leftBorder + 1.5 * 50 * tick, yPos: bfYPos - 6, fontSize: 5.0)
    
    drawText(text: "0.0", xPos: bfXPos + 2.3 * 50 * tick, yPos: bfYPos, fontSize: 7)
    
    drawText(text: "∞", xPos: bfXPos, yPos: bfYPos + 2.3 * 50 * tick, fontSize: 7, isCentered: true)
    
    path.move(to: NSMakePoint(bfXPos, bfYPos + 0.2 * 50 * tick))
    path.line(to: NSMakePoint(bfXPos, bfYPos + 2.3 * 50 * tick))

    path.move(to: NSMakePoint(bfXPos + 0.2 * 50 * tick, bfYPos - 2.0 * tick))
    path.line(to: NSMakePoint(bfXPos + 0.2 * 50 * tick, bfYPos + 2.0 * tick))

    drawText(text: "←", xPos: bfXPos + 0.2 * 50 * tick, yPos: bfYPos - 6, fontSize: 5)
    drawText(text: "→", xPos: bfXPos + 2.2 * 50 * tick - 5, yPos: bfYPos - 6, fontSize: 5)

    path.move(to: NSMakePoint(bfXPos + 0.2 * 50 * tick, bfYPos - 4.41))
    path.line(to: NSMakePoint(bfXPos + 1.05 * 50 * tick, bfYPos - 4.41))

    path.move(to: NSMakePoint(bfXPos + 1.34 * 50 * tick, bfYPos - 4.41))
    path.line(to: NSMakePoint(bfXPos + 2.2 * 50 * tick, bfYPos - 4.41))

    path.move(to: NSMakePoint(bfXPos + 2.2 * 50 * tick, bfYPos - 2.0 * tick))
    path.line(to: NSMakePoint(bfXPos + 2.2 * 50 * tick, bfYPos + 2.0 * tick))

    var tangents : [(tangent:CGFloat, size:CGFloat)] = []
    
    var tangent : CGFloat = 0.00
    
    for index in 0...100 {
      let size : CGFloat = index % 5 == 0 ? 0.1 : 0.02
      tangents.append((tangent, size))
      tangent += 0.02
    }

    tangent = 2.1
    
    for index in 1...30 {
      let size : CGFloat = index % 10 == 0 ? 0.1 : index % 5 == 0 ? 0.04 : 0.02
      tangents.append((tangent, size))
      tangent += 0.1
    }

    tangent = 5.2
    
    for index in 1...15 {
      let size : CGFloat = index % 5 == 0 ? 0.1 : 0.02
      tangents.append((tangent, size))
      tangent += 0.2
    }

    tangent = 8.5
    
    for index in 1...4 {
      let size : CGFloat = index % 2 == 0 ? 0.1 : 0.04
      tangents.append((tangent, size))
      tangent += 0.5
    }

    tangent = 11.0
    
    for index in 1...6 {
      let size : CGFloat = 0.1
      tangents.append((tangent, size))
      tangent += 1.0
    }

    for tangent in tangents {
      
      if tangent.tangent == 0.0 {
        continue
      }
      
      let theta = atan(tangent.tangent)

      var y1 = 0.2 * sin(theta) * 50 * tick
      var x1 = y1 / tangent.tangent
      var y2 = (0.2 + tangent.size) * sin(theta) * 50 * tick
      var x2 = y2 / tangent.tangent
      
      y1 = (tangent.size == 0.1 ? 2.2 : 2.2) * sin(theta) * 50 * tick
      x1 = y1 / tangent.tangent
      y2 = (2.2 + tangent.size) * sin(theta) * 50 * tick
      x2 = y2 / tangent.tangent
      
      path.move(to: NSMakePoint(bfXPos + x1, bfYPos + y1))
      path.line(to: NSMakePoint(bfXPos + x2, bfYPos + y2))

      if tangent.size == 0.1 {
        
        if tangent.tangent < 2.0 {
          drawText(text: "\(round(tangent.tangent * 100) / 100.0)", xPos: bfXPos + x2, yPos: bfYPos + y2, fontSize: 7.0, isCentered: false)
        }
        else if tangent.tangent < 9.0 {
          var text = "\(round(tangent.tangent))"
          text.removeLast(2)
          drawText(text: text, xPos: bfXPos + x2, yPos: bfYPos + y2, fontSize: 7.0, isCentered: false)
        }
      }
      
      
    }
    
    tangents.removeAll()
    
    tangent = 0
    
    for index in 0...20 {
      let size : CGFloat = index % 5 == 0 ? 0.1 : 0.02
      tangents.append((tangent, size))
      tangent += 0.1
    }

    tangent = 3
    
    for index in 0...6 {
      let size : CGFloat = 0.1
      tangents.append((tangent, size))
      tangent += 1.0
    }

    for tangent in tangents {
      
      if tangent.tangent == 0.0 {
        continue
      }
      
      let theta = atan(tangent.tangent)

      var y1 = 0.2 * sin(theta) * 50 * tick
      var x1 = y1 / tangent.tangent
      var y2 = (0.2 + tangent.size) * sin(theta) * 50 * tick
      var x2 = y2 / tangent.tangent
      
      path.move(to: NSMakePoint(bfXPos + x1, bfYPos + y1))
      path.line(to: NSMakePoint(bfXPos + x2, bfYPos + y2))

      if tangent.size == 0.1 {
        
        if tangent.tangent < 2.0 {
          drawText(text: "\(round(tangent.tangent * 100) / 100.0)", xPos: bfXPos + x2, yPos: bfYPos + y2, fontSize: 7.0, isCentered: false)
        }
        else if tangent.tangent < 4.0 {
          var text = "\(round(tangent.tangent))"
          text.removeLast(2)
          drawText(text: text, xPos: bfXPos + x2, yPos: bfYPos + y2, fontSize: 7.0, isCentered: false)
        }
      }
      
      
    }

    path.stroke()

    let bPath = NSBezierPath()
    
    bPath.lineWidth = 0.25
    
    bPath.appendArc(withCenter: NSMakePoint(bfXPos, bfYPos), radius: 0.2 * 50 * tick, startAngle: 0.0, endAngle: 90.0)

    bPath.stroke()
    
    bPath.removeAllPoints()

    bPath.appendArc(withCenter: NSMakePoint(bfXPos, bfYPos), radius: 2.2 * 50 * tick, startAngle: 0.0, endAngle: 90.0)

    bPath.stroke()
    
    
  }
  
  private func drawText(text: String, xPos: CGFloat, yPos: CGFloat, fontSize: CGFloat, isCentered: Bool = false, color: NSColor = .black) {
    
    let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle

    let textFontAttributes = [
        NSAttributedString.Key.font: NSFont.systemFont(ofSize: fontSize),
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.paragraphStyle: textStyle
    ] as [NSAttributedString.Key : Any]

    let width = widthInPoints(text: text, attributes: textFontAttributes)
    
    let offset : CGFloat = isCentered ? width / 2.0 : 0.0
    
    let textRect = CGRect(x: xPos - offset, y: yPos, width: width, height:fontSize)
    
    text.draw(in: textRect, withAttributes: textFontAttributes)
    
  }
  
  public func printToPaper(view: NSView) {
      let printInfo = NSPrintInfo.shared
    printInfo.horizontalPagination = .clip
    printInfo.verticalPagination = .clip
      printInfo.isHorizontallyCentered = true
      printInfo.isVerticallyCentered = true
    printInfo.bottomMargin = 0.0
    printInfo.topMargin = 0.0
    printInfo.leftMargin = 0.0
    printInfo.rightMargin = 0.0

    let printOperation = NSPrintOperation(view: view, printInfo: printInfo)
    printOperation.run()
  }
  
  func widthInPoints(text:String, attributes:[NSAttributedString.Key : Any]) -> CGFloat {
    return (text as NSString).size(withAttributes: attributes).width
  }

  func heightInPoints(text:String, attributes:[NSAttributedString.Key : Any]) -> CGFloat {
    return (text as NSString).size(withAttributes: attributes).height
  }

}

