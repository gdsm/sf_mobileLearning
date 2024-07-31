//
//  Telephony.swift
//  SwiftLearning
//
//  Created by Gagandeep on 10/04/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import CoreTelephony

class Telephony {
    static let instance = Telephony()
    
    func debug() {
        getRadioAccessInfo()
        getCellularProviderInfo()
    }
    
    private func getRadioAccessInfo() {
        let info = CTTelephonyNetworkInfo()
        let v = info.serviceCurrentRadioAccessTechnology
        print("---> serviceCurrentRadioAccessTechnology \(String(describing: v))")
    }
    
    private func getCellularProviderInfo() {
        let info = CTTelephonyNetworkInfo()
        let v = info.serviceSubscriberCellularProviders
        print("---> serviceSubscriberCellularProviders \(String(describing: v))")
    }
}
