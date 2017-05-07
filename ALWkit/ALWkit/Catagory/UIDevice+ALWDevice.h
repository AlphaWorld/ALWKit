//
//  UIDevice+ALWDevice.h
//  ALWkit
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 AlphaWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ALWNetWorkStatus) {
    ALWNetWorkStatusNotReachable = 0,
    ALWNetWorkStatusUnknown = 1,
    ALWNetWorkStatusWWAN2G = 2,
    ALWNetWorkStatusWWAN3G = 3,
    ALWNetWorkStatusWWAN4G = 4,
    ALWNetWorkStatusWiFi = 9,
};

@interface UIDevice (ALWDevice)

+ (ALWNetWorkStatus)currentNetWorkStatus;
+ (NSString *)currentNetWorkStatusString;

@end
