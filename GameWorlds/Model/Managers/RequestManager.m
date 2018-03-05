//
//  RequestManager.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"

@implementation RequestManager

#pragma mark - Inicialization

+ (RequestManager*)sharedManager{
    
    static RequestManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [RequestManager new];
    });
    return manager;
}

#pragma mark - POST

@end
