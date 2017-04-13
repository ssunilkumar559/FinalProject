//
//  LoginViewController.h
//  ProjectDraft
//
//  Created by rtuser on 4/9/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)btnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *admintxtfld;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
