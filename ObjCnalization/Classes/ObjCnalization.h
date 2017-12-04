//
//  ObjCnalization.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef NSString CountryCode;
@class Translation;


@interface ObjCnalization : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSArray<Translation*>* translations;
@property (nonatomic, assign) BOOL configured;

#pragma mark - Public methods

- (void) configure:(NSBundle*) bundle;

- (void) configureIfNeeded:(NSBundle*) bundle;

// Very Simple method
- (NSString*) localizedString:(NSString*) key;

// Without number value
- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;

// String number
- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;

// Int number
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;


#pragma mark - Private methods

- (void) load:(NSBundle*) bundle;
- (CountryCode*) getPreferredLanguage:(NSBundle*) bundle;

@end

typedef ObjCnalization I18n;
