
#import "MenuViewController.h"
#import "ViewController.h"
<<<<<<< HEAD
#import "UserNameInputViewController.h"
@implementation MenuViewController

=======

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Increment the visitor count
       NSInteger visitorCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"VisitorCount"];
       visitorCount++;
       [[NSUserDefaults standardUserDefaults] setInteger:visitorCount forKey:@"VisitorCount"];
}

>>>>>>> fares
- (IBAction)playButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   ViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    // Present the other view controller
    [self presentViewController:viewController animated:YES completion:nil];
}

<<<<<<< HEAD
- (IBAction)userNameButtonPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserNameInputController *userNameInputController = [storyboard instantiateViewControllerWithIdentifier:@"UserNameInputController"];
    
  
    [self presentViewController:userNameInputController animated:YES completion:nil];
}
=======

>>>>>>> fares



@end
