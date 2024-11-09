//
//  NetworkMonitor.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 20/05/24.
//

import SwiftUI
import Network


class NetworkMonitor: ObservableObject {
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue
    
    @Published var isConnected: Bool = true
    
    init() {
        monitor = NWPathMonitor()
        queue = DispatchQueue.global(qos: .background)
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}

