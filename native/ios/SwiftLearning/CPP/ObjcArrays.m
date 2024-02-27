//
//  ObjcArrays.m
//  SwiftLearning
//
//  Created by Gagan on 02/07/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

#import "ObjcArrays.h"

@implementation ObjcArrays

- (void) testArrays
{
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    [arr addObject:@"---------------------1"];
    NSLog(@"Loc 1 : %p", [arr objectAtIndex:0]);

    [arr addObject:@"----------------------2"];
    NSLog(@"Loc 1 : %p", [arr objectAtIndex:0]);
    NSLog(@"Loc 2 : %p", [arr objectAtIndex:1]);


    [arr addObject:@"---------------------------------3"];
    NSLog(@"Loc 1 : %p", [arr objectAtIndex:0]);
    NSLog(@"Loc 2 : %p", [arr objectAtIndex:1]);
    NSLog(@"Loc 3 : %p", [arr objectAtIndex:2]);
}

@end
