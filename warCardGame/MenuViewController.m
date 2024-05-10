
#import "MenuViewController.h"
#import "ViewController.h"

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Increment the visitor count
       NSInteger visitorCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"VisitorCount"];
       visitorCount++;
       [[NSUserDefaults standardUserDefaults] setInteger:visitorCount forKey:@"VisitorCount"];
}

- (IBAction)playButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   ViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    // Present the other view controller
    [self presentViewController:viewController animated:YES completion:nil];
}





@end
	
