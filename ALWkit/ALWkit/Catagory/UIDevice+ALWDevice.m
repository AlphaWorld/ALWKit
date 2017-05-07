//
//  UIDevice+ALWDevice.m
//  ALWkit
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 AlphaWorld. All rights reserved.
//

#import "UIDevice+ALWDevice.h"
#import <Reachability/Reachability.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation UIDevice (ALWDevice)

+ (ALWNetWorkStatus)currentNetWorkStatus
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    switch ([reachability currentReachabilityStatus]) {
        case NotReachable:
            return ALWNetWorkStatusNotReachable;
        case ReachableViaWiFi:
            return ALWNetWorkStatusWiFi;
        case ReachableViaWWAN: {
            NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                                       CTRadioAccessTechnologyGPRS,
                                       CTRadioAccessTechnologyCDMA1x];
            
            NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                                       CTRadioAccessTechnologyWCDMA,
                                       CTRadioAccessTechnologyHSUPA,
                                       CTRadioAccessTechnologyCDMAEVDORev0,
                                       CTRadioAccessTechnologyCDMAEVDORevA,
                                       CTRadioAccessTechnologyCDMAEVDORevB,
                                       CTRadioAccessTechnologyeHRPD];
            
            NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
            CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
            NSString *accessString = networkInfo.currentRadioAccessTechnology;
            if ([typeStrings2G containsObject:accessString]) {
                return ALWNetWorkStatusWWAN2G;
            } else if ([typeStrings3G containsObject:accessString]) {
                return ALWNetWorkStatusWWAN3G;
            } else if ([typeStrings4G containsObject:accessString]) {
                return ALWNetWorkStatusWWAN4G;
            }
        }
        default:
            return ALWNetWorkStatusUnknown;
    }
}

+ (NSString *)currentNetWorkStatusString
{
    NSString *string;
    switch ([UIDevice currentNetWorkStatus]) {
        case ALWNetWorkStatusWiFi:
            string = @"WIFI";
            break;
        case ALWNetWorkStatusWWAN2G:
            string = @"2G";
            break;
        case ALWNetWorkStatusWWAN3G:
            string = @"3G";
            break;
        case ALWNetWorkStatusWWAN4G:
            string = @"4G";
            break;
        case ALWNetWorkStatusNotReachable:
            string = @"NotReachable";
            break;
        case ALWNetWorkStatusUnknown:
            string = @"Unknown";
            break;
        default:
            string = @"Unknown";
            break;
    }
    return string;
}


@end
