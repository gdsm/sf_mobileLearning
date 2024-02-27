//
//  ObjcSwiftComm.m
//  SwiftLearning
//
//  Created by Gagandeep Madan on 16/09/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

#import "ObjcSwiftComm.h"
#import "SwiftLearning-Swift.h"

@implementation ObjcSwiftComm

- (NSString *)objcString {
    return @"This is objc string";
}

- (void) debugAll {
    
    SwiftObjcComm* so = [[SwiftObjcComm alloc] init];
 
    SwiftObjcCommEnum e = so.getSwiftEnum;
    NSLog(@"Swift enum %ld", (long)e);
    
    NSDictionary* t = so.getSwiftTuple;
    NSLog(@"Swift Tupple %@", t);
}

@end
