//
//  HighScoresViewController.m
//  warCardGame
//
//  Created by csis235 on 5/9/24.
//  Copyright © 2024 csis235. All rights reserved.
//

#import "HighScoresViewController.h"


@implementation HighScoresViewController

- (void)viewDidLoad {
    
        [super viewDidLoad];
          
          // Create and configure the table view
          self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
          self.tableView.dataSource = self;
          self.tableView.delegate = self;
          [self.view addSubview:self.tableView];
          
          // Load usernames from UserDefaults
          [self loadUsernamesFromUserDefaults];
}

- (void)loadUsernamesFromUserDefaults {
       // Get the usernames from UserDefaults
    NSArray *usernames = [[NSUserDefaults standardUserDefaults] objectForKey:@"Usernames"];
    
    // Check if usernames exist
    if (usernames && [usernames isKindOfClass:[NSArray class]]) {
        self.usernames = usernames;
        [self.tableView reloadData]; // Reload table to display usernames
    } else {
        NSLog(@"No usernames found in UserDefaults.");
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usernames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UsernameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell with username
    cell.textLabel.text = self.usernames[indexPath.row];
    
    return cell;
}

@end
