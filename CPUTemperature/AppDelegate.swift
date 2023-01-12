//
//  AppDelegate.swift
//  CPUTemperature
//
//  Created by yurk on 06.01.2023.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem: NSStatusItem!
    private var updateTemperatureTimer: Timer!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        updateTemperatureTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
            if let button = self.statusItem.button {
                button.title = self.getCPUTemperature()
            }
        })
        setupMenu()
    }
    
    private func getCPUTemperature() -> String
    {
        return String(format: "%.1f ºC", arguments: [SMCObj.calculateTemp()])
    }
    
    private func setupMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

