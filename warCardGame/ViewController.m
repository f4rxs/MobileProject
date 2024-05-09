//
//  ViewController.m
//  warCardGame
//
//  Created by csis235 on 29/02/2024.
//  Copyright © 2024 csis235. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int cardNumberForPlayer1, cardNumberForPlayer2;
    NSString *value1,*value2,*value3,*value4,*value5,*value6;
}
@property (weak, nonatomic) IBOutlet UIImageView *player1card;
@property (weak, nonatomic) IBOutlet UIImageView *player2card;
@property (weak, nonatomic) IBOutlet UITextField *player1scorelabel;
@property (weak, nonatomic) IBOutlet UITextField *player2scorelabel;
@property (weak, nonatomic) IBOutlet UITextField *winnerlabel;
@property (nonatomic) int player1Score;
@property (nonatomic) int player2Score;
@property (nonatomic) int highestScore;
@property (nonatomic) int roundIndex;
@property (nonatomic, strong) NSString *cardOfPlayer1;
@property (weak, nonatomic) IBOutlet UITextField *highestscoreLabel;
@property (nonatomic, strong) NSString *cardOfPlayer2;
@property (nonatomic,strong) NSString *card1Deck;
@property (nonatomic,strong) NSString *card2Deck;
@property (nonatomic,strong) NSString *card3Deck;
@property (nonatomic,strong) NSString *card4Deck;
@property (nonatomic,strong) NSString *card5Deck;
@property (nonatomic,strong) NSString *card6Deck;
@property (weak, nonatomic) IBOutlet UITextField *roundInicator;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage1;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage2;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage3;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage4;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage5;
@property (weak, nonatomic) IBOutlet UIImageView *cardimage6;
@property (nonatomic,strong) NSMutableArray* playedCards;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
                
    [self startGame];
    
    // CYNTHIA PUSHED COMMIT HERE
    
}

- (void)fillCardImageViewsWithRandomCards {
    NSMutableArray *cards = [NSMutableArray arrayWithObjects:@"card2", @"card3", @"card4", @"card5", @"card6", @"card7",@"card8",@"card9",@"card10",nil];
       for (int i = 0; i < 6; i++) {
           int randomIndex = arc4random_uniform((uint32_t)cards.count);
           NSString *cardName = [cards objectAtIndex:randomIndex];
           
           switch(i) {
               case 0: value1 = cardName; break;
               case 1: value2 = cardName; break;
            case 2: value3 = cardName; break;
                   case 3: value4 = cardName; break;
                   case 4: value5 = cardName; break;
                   case 5: value6 = cardName; break;
                   
           }
           UIImageView *imageView = [self imageViewForCardNumber:i + 1];
           imageView.image = [UIImage imageNamed:cardName];
           [cards removeObjectAtIndex:randomIndex];
}
    

}
- (UIImageView *)imageViewForCardNumber:(NSInteger)cardNumber {
    switch (cardNumber) {
        case 1:
            return self.cardimage1;
        case 2:
            return self.cardimage2;
        case 3:
            return self.cardimage3;
        case 4:
            return self.cardimage4;
        case 5:
            return self.cardimage5;
        case 6:
            return self.cardimage6;
        default:
            return nil;
    }
}



- (IBAction)dealButton:(UIButton *)sender {
    NSString *title = sender.currentTitle;
    
    if([title isEqual:(@"DEAL")]) {
       if (self.roundIndex < 6) {
           int randomNumberForPlayer2 = arc4random_uniform(9) + 2;
           cardNumberForPlayer2 = randomNumberForPlayer2;
           self.cardOfPlayer2 = [NSString stringWithFormat:@"card%d", randomNumberForPlayer2];
           self.player2card.image = [UIImage imageNamed:self.cardOfPlayer2];
           
           [self compareCards];
           [self updateUI];
           self.roundIndex++;
       } else {
           [sender setTitle:@"Replay" forState:UIControlStateNormal];
           [self endGame];
       }
    } else if ([title isEqual:@"Replay"]) {
        [sender setTitle:@"DEAL" forState:UIControlStateNormal];
        [self startGame];
    }
       
    
    
}


- (void)compareCards {
    //int cardNumberForPlayer1 = [self extractCardNumberFromName:self.cardOfPlayer1];
    //int cardNumberForPlayer2 = [self extractCardNumberFromName:self.cardOfPlayer2];
    
    if (cardNumberForPlayer1 > cardNumberForPlayer2) {
        self.player1Score+=2;
    } else if (cardNumberForPlayer1 < cardNumberForPlayer2) {
        self.player2Score+=2;
    } else {
        self.player1Score+=1;
        self.player2Score+=1;
    }
}

- (void)endGame {
  
    if (self.player1Score > self.player2Score) {
        self.winnerlabel.text = @"Player 1 Wins!";
    } else if (self.player1Score < self.player2Score) {
        self.winnerlabel.text = @"Player 2 Wins!";
    } else {
        self.winnerlabel.text = @"It's a Tie!";
    }
    
    [self highestScore];
    self.highestscoreLabel.text = [NSString stringWithFormat:@"Highest score is %d", _highestScore];
    
}
- (int)extractCardNumberFromName:(NSString *)cardName {
    return [[cardName substringFromIndex:4] intValue];
}

- (void)updateUI {
    // Update scores and round indicator.
    self.player1scorelabel.text = [NSString stringWithFormat:@"%d", self.player1Score];
    self.player2scorelabel.text = [NSString stringWithFormat:@"%d", self.player2Score];
    self.roundInicator.text = [NSString stringWithFormat:@"%d", self.roundIndex];
}

- (void)addTapGestureRecognizerToImageView:(UIImageView *)imageView {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [imageView addGestureRecognizer:tapGestureRecognizer];
    imageView.userInteractionEnabled = YES;
}

- (IBAction)imageTap:(UITapGestureRecognizer *)imageTap {
      UIImageView *tappedImageView = (UIImageView *)imageTap.view;
       NSString *tappedCardName = [self cardNameForImageView:tappedImageView];
       
       if (![self.playedCards containsObject:tappedCardName]) {
           self.cardOfPlayer1 = tappedCardName;
           self.player1card.image = tappedImageView.image;
           
           cardNumberForPlayer1 = [self extractCardNumberFromName:tappedCardName];
           
           [self.playedCards addObject:tappedCardName];
           
           //[self compareCards];
           [self updateUI];
           
           tappedImageView.image = nil;
           tappedImageView.userInteractionEnabled = NO;
       }
}

- (NSString *)cardNameForImageView:(UIImageView *)imageView {
    if (imageView == self.cardimage1) {
        return value1;
    } else if (imageView == self.cardimage2) {
        return value2;
    } else if (imageView == self.cardimage3) {
        return value3;
    } else if (imageView == self.cardimage4) {
        return value4;
    } else if (imageView == self.cardimage5) {
        return value5;
    } else if (imageView == self.cardimage6) {
        return value6;
    } else {
        return nil;
    }
}

- (void) highestScore {
    if(_player1Score > _highestScore && _player1Score > _player2Score) {
        _highestScore = _player1Score;
    }
    else if (_player2Score > _highestScore ){
        _highestScore = _player2Score;
    }
}

- (void) startGame {
    // Initialize variables and fields.
    self.player1Score = 0;
    self.player2Score = 0;
    self.roundIndex = 0;
    self.cardOfPlayer1 =nil;
    self.cardOfPlayer2 = @"card3";
    self.playedCards = [NSMutableArray array];
    self.winnerlabel.text = @" ";
    self.highestscoreLabel.text = @" ";
    [self updateUI];
    [self fillCardImageViewsWithRandomCards];
    
    
    // Add gesture recognition for the views.
    [self addTapGestureRecognizerToImageView:self.cardimage1];
    [self addTapGestureRecognizerToImageView:self.cardimage2];
    [self addTapGestureRecognizerToImageView:self.cardimage3];
    [self addTapGestureRecognizerToImageView:self.cardimage4];
    [self addTapGestureRecognizerToImageView:self.cardimage5];
    [self addTapGestureRecognizerToImageView:self.cardimage6];

}
@end
