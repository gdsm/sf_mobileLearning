//
//  ObjcThreading.m
//  SwiftLearning
//
//  Created by Gagan on 27/09/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

#import "ObjcThreading.h"

@implementation ObjcThreading {
    dispatch_queue_attr_t qos;
    dispatch_queue_t concurrentQueue;
}

+ (ObjcThreading *) shared {
    static ObjcThreading *sharedHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHelper = [[self alloc] init];
    });
    
    return sharedHelper;
}

- (void)testSynchronisation {
    qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_BACKGROUND, -1);
    concurrentQueue = dispatch_queue_create("Consurrent Queue", qos);
    
    __block NSInteger i = 1;
    __block NSInteger j = 0;
    dispatch_async(concurrentQueue, ^{
//        @synchronized (self) {
            while(i<100) {
                NSLog(@"i : %ld", (long)i);
                j = j+1;
                i = i+1;
            }
//        }
    });
    
    dispatch_async(concurrentQueue, ^{
//        @synchronized (self) {
            while(i<200) {
                NSLog(@"j : %ld", (long)j);
                j = j-1;
                i = i+1;
            }
//        }
    });
}

@end
