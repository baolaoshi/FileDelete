//
//  ViewController.swift
//  FileDelete
//
//  Created by Martin Lorenzo Bautista on 10/24/15.
//  Copyright (c) 2015 Renzo Bautista. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let openPanel : NSOpenPanel = NSOpenPanel()
    let fileManager : NSFileManager = NSFileManager.defaultManager()

    @IBOutlet var directoryPopupButton: DirectoryPopupButton!
    
    @IBAction func directoryAdded(sender: AnyObject) {
        openPanel.beginSheetModalForWindow(self.view.window!, completionHandler: { (x) -> Void in
            if x == 0 {
                println("An error occurred when finding the directory.")
            } else {
                let newURL : NSURL = self.openPanel.URLs.first as NSURL
                self.directoryPopupButton.addURL(newURL)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOpenPanel()
        setupDirectoryPopupButton()
        refreshFiles()
    }
    
    func setupOpenPanel() {
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
    }
    
    func setupDirectoryPopupButton() {
        directoryPopupButton.removeAllItems()
        
        var downloadURL = fileManager.URLsForDirectory(.DownloadsDirectory, inDomains: .UserDomainMask).first as NSURL
        directoryPopupButton.addURL(downloadURL)
    }
    
    func refreshFiles() {
        let ind : Int = directoryPopupButton.indexOfSelectedItem
        let url : NSURL = directoryPopupButton.getURLAtIndex(ind)
        let files = fileManager.contentsOfDirectoryAtURL(url, includingPropertiesForKeys: nil, options: nil, error: nil)
        println(files)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

