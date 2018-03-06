//
//  TextTableCell.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameWorld;
@interface TextTableCell : UITableViewCell

- (void)setupWith:(GameWorld*)gameWorld;

@end
