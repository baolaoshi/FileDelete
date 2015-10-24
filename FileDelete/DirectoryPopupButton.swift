//
//  DirectoryPopupButton.swift
//  FileDelete
//
//  Created by Martin Lorenzo Bautista on 10/24/15.
//  Copyright (c) 2015 Renzo Bautista. All rights reserved.
//

import Cocoa

class DirectoryPopupButton: NSPopUpButton {
    
    var urls : [NSURL] = []
    var titles : [String] = []
    
    func addURL(url : NSURL) {
        urls.append(url)
        titles.append(url.lastPathComponent!)
        self.addItemWithTitle(url.lastPathComponent!)
    }
    
    func getURLAtIndex(ind : Int) -> NSURL {
        return urls[ind]
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
    override func drawFocusRingMask() {
    }
    
}
