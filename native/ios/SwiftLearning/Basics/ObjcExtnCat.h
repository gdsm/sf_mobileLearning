//
//  ObjcExtnCat.h
//  SwiftLearning
//
//  Created by Gagandeep Singh Madan on 25/07/21.
//  Copyright © 2021 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Actual Class
@interface ObjcExtnCat : NSObject
- (void) debug;
//- (void) method;
@end

//Extension
@interface ObjcExtnCat()
- (void) method;
@end

//Category
@interface  ObjcExtnCat(Additions)
- (void) method;
@end


NS_ASSUME_NONNULL_END
