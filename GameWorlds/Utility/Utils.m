//
//  Utils.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "Utils.h"

NSString* const kBaseURL = @"http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/";

@implementation Utils

+ (NSString*)getDeviseType{
    
    NSString* deviseType = [NSString stringWithFormat:@"%@ - %@%@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
    return  deviseType;
}

+ (NSString*)getDeviseId{
     NSString* deviceId = [[NSUUID UUID] UUIDString];
    return  deviceId;
}

@end
