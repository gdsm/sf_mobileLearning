//
//  ObjcSwiftComm.h
//  SwiftLearning
//
//  Created by Gagandeep Madan on 16/09/19.
//  Copyright © 2019 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ObjcEnumType) {
    ObjcEnumType_objc1, ObjcEnumType_objc2
};

/*
 *
 using enum in objc and calling it from swift won't do explilcit conversion where as using NS_Enum will convert to swift enum
 */

@interface ObjcSwiftComm : NSObject

@property (nonatomic, strong) NSString* objcString;

- (void) debugAll;

@end

NS_ASSUME_NONNULL_END
