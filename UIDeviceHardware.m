//
//  UIDeviceHardware.m
//  LogicsTests
//
//  Created by George Villasboas on 21/08/13.
//  Copyright (c) 2013 Logics Software. All rights reserved.
//

#import "UIDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDeviceHardware

/**
 *  Extracts the platform CString from the system constants. More performance.
 *
 *  @return NSString with the current hardware platform
 */
+ (NSString *) platform{
    int mib[] = {CTL_HW, HW_MACHINE};
    size_t len = 0;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    char *machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}

/**
 *  Returns a more friendly format for the plarform string. Ex.: iPhone5,2 = iPhone 5 (GSM+CDMA)
 *
 *  @return A friendly description of the current hardware platform
 */
+ (NSString *) platformString{
    NSString *platform = [UIDeviceHardware platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

/**
 *  Group the platforms based on device type and screen sizes so its easier to handle hardware diferences
 *
 *  @return A generic type for the current hardware
 */
+ (UIDeviceHardwareGenericType)genericDeviceType
{
    UIDeviceHardwareGenericType genericType = UIDeviceHardwareGenericTypeUnknown;
    NSString *platform = [UIDeviceHardware platform];
    
    if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // default type for phone
        genericType = UIDeviceHardwareGenericTypePhone40;
        
        if ([platform rangeOfString:@"iPhone1,"].location != NSNotFound ||
            [platform rangeOfString:@"iPhone2,"].location != NSNotFound ||
            [platform rangeOfString:@"iPhone3,"].location != NSNotFound ||
            [platform rangeOfString:@"iPhone4,"].location != NSNotFound) {
            genericType = UIDeviceHardwareGenericTypePhone35;
        }
        else if([platform rangeOfString:@"iPod1,"].location != NSNotFound ||
                [platform rangeOfString:@"iPod2,"].location != NSNotFound ||
                [platform rangeOfString:@"iPod3,"].location != NSNotFound ||
                [platform rangeOfString:@"iPod4,"].location != NSNotFound){
            genericType = UIDeviceHardwareGenericTypePod35;
        }
        else if([platform rangeOfString:@"iPod5,"].location != NSNotFound){
            genericType = UIDeviceHardwareGenericTypePod40;
        }
    }
    else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        // default type for pad
        genericType = UIDeviceHardwareGenericTypePad97;
        
        if ([platform rangeOfString:@"iPad2,5"].location != NSNotFound ||
            [platform rangeOfString:@"iPad2,6"].location != NSNotFound ||
            [platform rangeOfString:@"iPad2,7"].location != NSNotFound) {
            genericType = UIDeviceHardwareGenericTypePad79;
        }
        
    }
    
    return genericType;
}

@end