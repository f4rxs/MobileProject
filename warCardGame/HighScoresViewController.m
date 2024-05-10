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
<<<<<<< HEAD
    // Do any additional setup after loading the view.
=======
    
    // Create and configure the table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    // Generate sample player scores
    [self generateSamplePlayerScores];
}

- (void)generateSamplePlayerScores {
    // Sample array of player names
    NSArray *playerNames = @[@"Player 1", @"Player 2", @"Player 3", @"Player 4", @"Player 5"];
    
    // Generate random scores for each player
    NSMutableArray *scores = [NSMutableArray array];
    for (NSString *name in playerNames) {
        // Generate a random score between 0 and 100
        NSInteger score = arc4random_uniform(101);
        NSDictionary *playerScore = @{@"name": name, @"score": @(score)};
        [scores addObject:playerScore];
    }
    
    // Sort the scores in descending order based on the score value
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
    self.playerScores = [scores sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    // Reload the table view to display the updated data
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playerScores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PlayerScoreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell with player name and score
    NSDictionary *playerScore = self.playerScores[indexPath.row];
    cell.textLabel.text = playerScore[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Score: %@", playerScore[@"score"]];
    
    return cell;
>>>>>>> fares
}

@end
