//
//  TBNetworkabilty.swift
//  TBNetworkabilty v0.1.2
//
//  Created by Todd Bruss on 7/6/21.
//  Copyright © 2019 Todd Bruss All rights reserved.
//  https://StarPlayrX.com
//

import Network
let monitor = NWPathMonitor()
var networkIsConnected = Bool()
var networkIsWiFi = Bool()
var networkIsTripped = false

public class TBNetworkability {
    
    func start() {
        
        monitor.pathUpdateHandler = { path in
            
            networkIsConnected = (path.status == .satisfied)
            
            if !networkIsConnected {
                networkIsTripped = true
            }
            
            networkIsWiFi = path.usesInterfaceType(.wifi)            
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}



