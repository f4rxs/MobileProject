//
//  HighScoresViewController.h
//  warCardGame
//
//  Created by csis235 on 5/9/24.
//  Copyright © 2024 csis235. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoresViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray<NSDictionary *> *playerScores;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
