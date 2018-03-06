//
//  TextTableCell.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TextTableCell.h"
#import "GameWorld.h"

@interface TextTableCell()

@property (weak, nonatomic) IBOutlet UILabel* nameLable;

@end

@implementation TextTableCell

#pragma mark - Life cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setup

- (void)setupWith:(GameWorld*)gameWorld{
    
    self.nameLable.text = gameWorld.name;
}

@end
