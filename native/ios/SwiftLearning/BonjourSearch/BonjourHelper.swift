//
//  BonjourHelper.swift
//  SwiftLearning
//
//  Created by Gagandeep on 15/06/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation

class BonjourHelper: NSObject {
    
    static let instance = BonjourHelper()
    private let browser = NetServiceBrowser()
    private var services: [NetService] = []
    private var netService: NetService?

    func search() {
        browser.delegate = self
        browser.searchForServices(ofType: "_http._tcp.", inDomain: "local.")
    }
    
    func publish() {
        let serviceName = "My Service"
        let serviceType = "_http._tcp."
        let servicePort: Int32 = 1234

        netService = NetService(domain: "local.", type: serviceType, name: serviceName, port: servicePort)
        netService?.delegate = self
        netService?.publish()
    }
    
    private func extractIpAddress(service: NetService) {
        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
        guard let data = service.addresses?.first else {
            return
        }
        data.withUnsafeBytes { ptr in
            guard let sockaddr_ptr = ptr.baseAddress?.assumingMemoryBound(to: sockaddr.self) else {
                       // handle error
                return
            }
            var sockaddr = sockaddr_ptr.pointee
            guard getnameinfo(sockaddr_ptr, socklen_t(sockaddr.sa_len), &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 else {
                return
            }
        }
        let ipAddress = String(cString:hostname)
        print(ipAddress)
    }
    
    private func getIPv4Address(from data: Data) -> String? {
        var address = data.withUnsafeBytes { $0.load(as: sockaddr_in.self) }
        if address.sin_family == sa_family_t(AF_INET) {
            let ip = String(cString: inet_ntoa(address.sin_addr), encoding: .ascii)
            return ip
        }
        return nil
    }
}

extension BonjourHelper : NetServiceBrowserDelegate {
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        print("Found service \(service)")
        services.append(service)
        service.delegate = self
        service.resolve(withTimeout: 5.0)
    }
    
    func netServiceBrowserWillSearch(_ browser: NetServiceBrowser) {
        print("Starting search.")
    }
    
    func netServiceBrowser(_ browser: NetServiceBrowser, didFindDomain domainString: String, moreComing: Bool) {
        print("Found domain \(domainString)")
    }
}

extension BonjourHelper: NetServiceDelegate {
    func netServiceDidResolveAddress(_ sender: NetService) {
        if let hostName = sender.hostName, let addresses = sender.addresses, !addresses.isEmpty {
            print("Resolved service: \(sender.name) at \(hostName)")
            
            for address in addresses {
                if let ip = self.getIPv4Address(from: address) {
                    print("Resolved service: \(sender.name) at IP \(ip)")
                }
            }
        }
    }
    
    func netService(_ sender: NetService, didNotResolve errorDict: [String : NSNumber]) {
        print("Failed to resolve service: \(sender.name)")
    }
    
    func netServiceDidPublish(_ sender: NetService) {
        print("Service published: \(sender.name)")
    }

    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        print("Failed to publish service: \(sender.name)")
    }
}
