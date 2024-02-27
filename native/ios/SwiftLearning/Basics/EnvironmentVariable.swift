//
//  EnvironmentVariable.swift
//  SwiftLearning
//
//  Created by Gagan on 12/06/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

import Foundation


class EnvironmentVariable
{

    func readEnvironmentVariable() {
        let environment = ProcessInfo.processInfo.environment["FIRST_ENV_VAR"];
        let arguments = ProcessInfo.processInfo.arguments
        let processCount = ProcessInfo.processInfo.activeProcessorCount
        let globalUniqueName = ProcessInfo.processInfo.globallyUniqueString
        let hostName = ProcessInfo.processInfo.hostName
        let isLowPowerModeEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
        let physicalMemory = ProcessInfo.processInfo.physicalMemory;

        print("environment : ", environment);
        print("arguments : ", arguments);
        print("processCount : ", processCount);
        print("globalUniqueName : ", globalUniqueName);
        print("hostName : ", hostName);
        print("isLowPowerModeEnabled : ", isLowPowerModeEnabled);
        print("physicalMemory : ", physicalMemory);
    }
    
    func debugAll() {
        readEnvironmentVariable();
    }
}
