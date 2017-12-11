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
+ (instancetype)call; // short method of sharedInstance

@property (nonatomic, strong) NSArray<Translation*>* translations;
@property (nonatomic, assign) BOOL configured;

#pragma mark - Public methods

- (void) configure:(NSBundle*) bundle;

- (void) configureIfNeeded:(NSBundle*) bundle;


/**
 Get localized value for a (key).
 
 :param: key - to which localized string is assigned.
 :returns: localized value.
 */
// Short syntax
- (NSString*) locStr:(NSString*) key;

/**
 Get localized value for a (key).

 :param: key - to which localized string is assigned.
 :returns: localized value.
 */

// Full syntax
- (NSString*) localizedString:(NSString*) key;


/**
 Get localized value for a (key/defaultValue/comment).
 
 :param: key          - to which localized string is assigned.
 :param: defaultValue - the default value which will return method in case of failure
 :param: comment      - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */

- (NSString*) localizedString:(NSString*) key
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;


/**
 Get localized value for a (key/fittingWidth).
 
 :param: key          - to which localized string is assigned.
 :param: fittingWidth - max width that value should fit to. If there is no
                        value specified the full-length localized string is returned. If a
                        passed fitting width is greater than highest available then a value for
                        highest available width is returned.
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth;



/**
 Get localized value for a (key/fittingWidth/defaultValue/comment)
 
 :param: key          - to which localized string is assigned.
 :param: fittingWidth - max width that value should fit to. If there is no
                        value specified the full-length localized string is returned. If a
                        passed fitting width is greater than highest available then a value for
                        highest available width is returned.

 :param: defaultValue - the default value which will return method in case of failure
 :param: comment      - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;

/**
 Get localized value for a (key/stringValue)
 
 :param: key          - to which localized string is assigned.
 :param: stringValue  - value that is matched by expression
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue;


/**
 Get localized value for a (key/stringValue)
 
 :param: key          - to which localized string is assigned.
 :param: stringValue  - value that is matched by expression
 :param: defaultValue - the default value which will return method in case of failure
 :param: comment      - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */

- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;


/**
 Get localized value for a (key / stringValue / fittingWidth).
 
 :param: key           - to which localized string is assigned.
 :param: stringValue   - value that is matched by expression.
 :param: fittingWidth  - max width that value should fit to.

 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth;


/**
 Get localized value for a (key / stringValue / fittingWidth / defaultValue / comment).
 
 :param: key           - to which localized string is assigned.
 :param: stringValue   - value that is matched by expression.
 :param: fittingWidth  - max width that value should fit to.
 :param: defaultValue  - the default value which will return method in case of failure
 :param: comment       - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */

- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;

//------------------------------------------------------//



/**
 Get localized value for a (key / intValue).
 
 :param: key      - to which localized string is assigned.
 :param: intValue - value that is matched by expression.
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue;


/**
 Get localized value for a (key / intValue / defaultValue / comment).
 
 :param: key           - to which localized string is assigned.
 :param: intValue      - value that is matched by expression.
 :param: defaultValue  - the default value which will return method in case of failure
 :param: comment       - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;



/**
 Get localized value for a (key / intValue / fittingWidth).
 
 :param: key           - to which localized string is assigned.
 :param: intValue      - value that is matched by expression.
 :param: fittingWidth  - max width that value should fit to.

 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                 andFittWidth:(NSInteger) fittingWidth;


/**
 Get localized value for a (key / intValue / fittingWidth).
 
 :param: key           - to which localized string is assigned.
 :param: intValue      - value that is matched by expression.
 :param: fittingWidth  - max width that value should fit to.
 :param: defaultValue  - the default value which will return method in case of failure
 :param: comment       - about the key and localized value. Just for developer use for describing key-value pair.
 :returns: localized value.
 */
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment;


//------------------------------------------------------//


#pragma mark - Private methods

- (void) load:(NSBundle*) bundle;
- (CountryCode*) getPreferredLanguage:(NSBundle*) bundle;

@end

typedef ObjCnalization I18n;
