#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *appLogoImageView;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet UILabel *visitorsCountLabel;


@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    self.appLogoImageView.image = logoImage;
    
}

@end
