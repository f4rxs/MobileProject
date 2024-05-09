#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *appLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *visitorsCountLabel;



@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Retrieve visitor count from NSUserDefaults
    NSInteger visitorCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"VisitorCount"];
    
    // Display the visitor count
    self.visitorsCountLabel.text = [NSString stringWithFormat:@"Visitors: %ld", (long)visitorCount];
    
    // Load the logo image
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    self.appLogoImageView.image = logoImage;
    
}

@end
