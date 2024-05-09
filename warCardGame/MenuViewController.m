
#import "MenuViewController.h"
#import "ViewController.h"
#import "UserNameInputViewController.h"
@implementation MenuViewController

- (IBAction)playButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   ViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    // Present the other view controller
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)userNameButtonPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserNameInputController *userNameInputController = [storyboard instantiateViewControllerWithIdentifier:@"UserNameInputController"];
    
  
    [self presentViewController:userNameInputController animated:YES completion:nil];
}



@end
