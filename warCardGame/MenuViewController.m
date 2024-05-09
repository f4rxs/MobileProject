
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

- (IBAction)playButtonPressed:(id)sender {//    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//   //ViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    //    // Present the other view controller
//    //[self presentViewController:viewController animated:YES completion:nil];
        newUsername = _tfUsername.text;
    
        date = self.datePicker.date;
    
    if(newUsername.length > 0) {
        // Create an instance of the SecondViewController
        ViewController *secondVC = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [self presentViewController:secondVC animated:YES completion:nil];
    }
    // Save the username to plist
    //[self saveUsernameToPlist:newUsername];
    
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
