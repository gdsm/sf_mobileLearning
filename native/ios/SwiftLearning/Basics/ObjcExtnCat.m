//
//  ObjcExtnCat.m
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 25/07/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

#import "ObjcExtnCat.h"

@implementation ObjcExtnCat

- (void) debug {
    
    [self method];
    [self checkData];
}

- (void) method {
    NSLog(@"Method on actual class is called");
}

- (void) checkData {
    uint8_t rawInt = 0;
    NSLog(@"rawInt Value Before: %d", rawInt);
    
    NSData* d = [@"ABab" dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSLog(@"rawInt Value After: %d", rawInt);
}

@end


@implementation ObjcExtnCat(Additions)
- (void)method {
    NSLog(@"Method on category additions.");
}
@end
