//
//  GameWorldsViewController.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "GameWorldsViewController.h"
#import "TextTableCell.h"
#import "ContentManager.h"
#import "AuthManager.h"
#import "SVProgressHUD.h"

@interface GameWorldsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel* infoLable;
@property(weak, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation GameWorldsViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(self.content.count > 0){
         [SVProgressHUD dismiss];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self logOut];
}

#pragma mark - Private methods

- (void)hiddenState:(BOOL)shouldHide{
    
    self.infoLable.hidden = shouldHide;
}

- (void)layout{
    
    [self hiddenState:YES];
    
    [SVProgressHUD show];
    [[ContentManager shareManager] getContentWithCompletion:^(BOOL success, NSArray *worlds, NSError *error) {
        if (success) {
            self.content = worlds;
             [self hiddenState:YES];
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
        }
    }];
    
    self.tableView.refreshControl = [[UIRefreshControl alloc] init];
    self.tableView.refreshControl.backgroundColor = [UIColor whiteColor];
    self.tableView.refreshControl.tintColor = [UIColor blueColor];
    [self.tableView.refreshControl addTarget:self
                                      action:@selector(reloadData)
                            forControlEvents:UIControlEventValueChanged];
    
}

- (void)reloadData{
    // Reload table data
    [[ContentManager shareManager] getContentWithCompletion:^(BOOL success, NSArray *worlds, NSError *error) {
        if (success) {
            self.content = worlds;
           [self.tableView reloadData];
        }
    }];
    
    // End the refreshing
    if (self.tableView.refreshControl){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor blackColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.tableView.refreshControl.attributedTitle = attributedTitle;
        
        [self.tableView.refreshControl endRefreshing];
    }
}

- (void)logOut{
    
    [[AuthManager sharedManager] logOut];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.content.count == 0) {
        [self hiddenState:NO];
    }
    return self.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifire = @"TextCell";
    
    TextTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire forIndexPath:indexPath];
    
    [cell setupWith:[self.content objectAtIndex:indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return NO;
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
                                           forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor grayColor];
    }
}


@end
