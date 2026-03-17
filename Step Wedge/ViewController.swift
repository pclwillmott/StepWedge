//
//  ViewController.swift
//  Step Wedge
//
//  Created by Paul Willmott on 31/01/2026.
//

import Cocoa

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    
    apertures()
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


  @IBAction func btnPrintAction(_ sender: Any) {
    
    graphPaperView.printToPaper(view: graphPaperView)
  }
  
  @IBOutlet weak var graphPaperView: GraphPaperView!
}

