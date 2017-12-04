//
//  LengthVariation.h
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LengthVariation : NSObject

/**
 Max width of a screen on which the `value` should be presented.
 */
@property (assign, nonatomic) NSInteger width;

/**
 String with localized content in some language.
 */
@property (strong, nonatomic) NSString* value;

- (instancetype)initWithWidth:(NSInteger) width strValue:(NSString*) value;

@end
