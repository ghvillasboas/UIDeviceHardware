//
//  UIDeviceHardware.h
//  LogicsTests
//
//  Created by George Villasboas on 21/08/13.
//  Copyright (c) 2013 Logics Software. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, UIDeviceHardwareGenericType) {
    UIDeviceHardwareGenericTypePhone40		= 0x01,
    UIDeviceHardwareGenericTypePhone35		= 0x02,
    UIDeviceHardwareGenericTypePad97        = 0x11,
    UIDeviceHardwareGenericTypePad79        = 0x12,
    UIDeviceHardwareGenericTypePod40        = 0x21,
    UIDeviceHardwareGenericTypePod35        = 0x22,
    UIDeviceHardwareGenericTypeSimulator    = 0x31,
    UIDeviceHardwareGenericTypeUnknown      = 0x99,
};

@interface UIDeviceHardware : NSObject

/**
 *  Extracts the platform CString from the system constants. More performance.
 *
 *  @return NSString with the current hardware platform
 */
+ (NSString *)platform;

/**
 *  Returns a more friendly format for the plarform string. Ex.: iPhone5,2 = iPhone 5 (GSM+CDMA)
 *
 *  @return A friendly description of the current hardware platform
 */
+ (NSString *)platformString;

/**
 *  Group the platforms based on device type and screen sizes so its easier to handle hardware diferences
 *
 *  @return A generic type for the current hardware
 */
+ (UIDeviceHardwareGenericType)genericDeviceType;

@end
