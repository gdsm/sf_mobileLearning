//
//  ObjcThreading.h
//  SwiftLearning
//
//  Created by Gagan on 27/09/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjcThreading : NSObject

+ (ObjcThreading *) shared;

- (void) testSynchronisation;

@end

NS_ASSUME_NONNULL_END
