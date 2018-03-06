//
//  GameWorld.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "GameWorld.h"

@implementation GameWorld

#pragma mark - Inicialization

- (id)initWithServerResponse:(NSDictionary*)responseObject{
    self = [super init];
    if (self) {
        self.id = [responseObject objectForKey:@"id"];
        self.name = [responseObject objectForKey:@"name"];
    }
    return self;
}
@end
