//
//  SetBase.h
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 26/03/20.
//  Copyright © 2020 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetBase : NSObject

- (id) initWithValue:(NSNumber *)value;
@property (nonatomic, strong) NSNumber* value;

@end

NS_ASSUME_NONNULL_END
