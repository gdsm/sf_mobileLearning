//
//  SetBase.m
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 26/03/20.
//  Copyright © 2020 Gagan. All rights reserved.
//

#import "SetBase.h"

@implementation SetBase

- (id) initWithValue:(NSNumber *)value {
    self = [super init];
    self.value  = value;
    return self;
}

- (BOOL)isEqual:(id)other
{
    BOOL r = YES;
    if (other == self) {
        r = YES;
    } else if (![super isEqual:other]) {
        r = NO;
    }
    return NO;
}

- (NSUInteger)hash {
    NSLog(@"Value : %@", _value);
    return 1;
}


@end
