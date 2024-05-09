
#import "MenuViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

NSString *newUsername;
NSDate *date;

@implementation MenuViewController

- (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 NSDate *now = [NSDate date];
 [self.datePicker setDate:now animated:NO];
}

- (IBAction)playButtonPressed:(id)sender {//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//   ViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
////         Present the other view controller
//    [self presentViewController:viewController animated:YES completion:nil];
//
   
//      NSString *newUsername = self.tfUsername.text; // Get the username from the text field
//
//      if (newUsername.length > 0) {
//          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//          ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
//
//          // Set the username property of the ViewController
//          viewController.username = newUsername;
//
//          // Present the ViewController
//          [self presentViewController:viewController animated:YES completion:nil];
//      } else {
//          NSLog(@"Username is empty.");
//      }
    
    NSString *newUsername = self.tfUsername.text;

    if (newUsername.length > 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];

        // Set the username property of the ViewController
        viewController.username = newUsername;
viewController.playerLabel.text =newUsername;
        // Present the ViewController
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        NSLog(@"Username is empty.");
    }
    
}


//- (IBAction)userNameButtonPressed:(id)sender {
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UserNameInputController *userNameInputController = [storyboard instantiateViewControllerWithIdentifier:@"UserNameInputController"];
//
//
//NSLog(@"Username is empty.");
//    [self presentViewController:userNameInputController animated:YES completion:nil];
//}

@end
