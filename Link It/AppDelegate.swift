//
//  AppDelegate.swift
//  Link It
//
//  Created by Royce Remulla on 4/2/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var theStatusItem: NSStatusItem?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        theStatusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let item = theStatusItem {
            if let menuButton = item.button {
                menuButton.image = NSImage(named: "link-32")
                
                let menu = NSMenu()
                menu.addItem(NSMenuItem(title: "Link It", action: #selector(AppDelegate.linkIt), keyEquivalent: ""))
                menu.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.quit), keyEquivalent: ""))
                
                theStatusItem?.menu = menu
            }
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
        // return true // For testing in Xcode, we want to simple quit the app on window close
    }
    
    @objc
    func linkIt() {
        print("Clicked")
        printPasteBoard()
    }
    
    @objc
    func quit() {
        NSApplication.shared.terminate(self)
    }
    
    @objc
    func printPasteBoard() {
        if let items = NSPasteboard.general.pasteboardItems {
            for item in items {
                for type in item.types {
                    print(type)
                }
            }
        }
    }
}
