//
//  RequestManager.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"
#import "GameWorld.h"
#import "Utils.h"

#define kGetGameWorlds [NSString stringWithFormat:@"%@worlds",kBaseURL]

@interface RequestManager()

@property (strong, nonatomic) AFHTTPSessionManager* requestManager;

@end

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

- (id)init{
    self = [super init];
    if (self){
                      
        self.requestManager = [[AFHTTPSessionManager alloc] init];
    }
    return self;
}

#pragma mark - POST

- (void)getGameWorldsWithLogin:(NSString*)login password:(NSString*)password
                      onCompletion:(void(^)(BOOL success, NSArray* worlds, NSError* error))completion{
    
    NSString* deviceType = [Utils getDeviseType];
    NSString* deviceId = [Utils getDeviseId];
    
    NSDictionary* parameters = @{@"login":login,
                                 @"password":password,
                                 @"deviceType":deviceType,
                                 @"deviceId":deviceId};
    
    self.requestManager.responseSerializer = [AFPropertyListResponseSerializer serializer];
    
    [self.requestManager POST:kGetGameWorlds
                   parameters:parameters
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          
                          NSMutableArray* dictionaryArray = [responseObject objectForKey:@"allAvailableWorlds"];
                          NSMutableArray* tempWorlds = [NSMutableArray new];
    
                          for (NSDictionary* dict in dictionaryArray) {
                              
                              GameWorld* gameWorld = [[GameWorld alloc] initWithServerResponse:dict];
                              [tempWorlds addObject:gameWorld];
                          }
                          
                          NSArray* worlds = [[NSArray alloc] initWithArray:tempWorlds];
                         
                          if (completion) {
                              completion(YES, worlds, nil);
                          }

                          
                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          
                          if (completion) {
                              completion(NO, nil, error);
                          }

                          
                      }];
}

@end
