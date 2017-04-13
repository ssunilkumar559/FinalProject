//
//  LoginViewController.m
//  ProjectDraft
//
//  Created by rtuser on 4/9/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "LoginViewController.h"
#import "CoreDataStack.h"
#import "Administrator+CoreDataProperties.h"
#import <UserNotifications/UserNotifications.h>

@interface LoginViewController ()<UNUserNotificationCenterDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self addAdminName];
    
}


/*-(void) addAdminName{
    CoreDataStack *cds = [CoreDataStack sharedStack];
    NSArray *allnames = @[@"Zahra", @"Sunil", @"Santosh", @"Hasibul"];
    for(int i = 0; i < allnames.count; i++){
        Administrator *admindb = [NSEntityDescription insertNewObjectForEntityForName:@"Administrator" inManagedObjectContext:cds.persistentContainer.viewContext];
        [admindb setValue:allnames[i] forKey:@"adminName"];
    }
    [cds saveContext];
}*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnclick:(id)sender {
    NSString *nametocheck = self.admintxtfld.text;
    CoreDataStack *cds = [CoreDataStack sharedStack];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Administrator" inManagedObjectContext:cds.persistentContainer.viewContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"adminName == %@", nametocheck];
    [fetchRequest setPredicate:predicate];
    
    
    NSError *error = nil;
    NSUInteger count = [cds.persistentContainer.viewContext countForFetchRequest:fetchRequest error:&error];
    
    if (count)
    {
        [self performSegueWithIdentifier:@"AdminSegue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"UserSegue" sender:self];
    }
    
    
    [self generateLocalNotification];
    
}

- (void)generateLocalNotification{
    
    UNMutableNotificationContent *localNotification = [UNMutableNotificationContent new];
    localNotification.title = [NSString localizedUserNotificationStringForKey:@"Info log" arguments:nil];
    localNotification.body = [NSString localizedUserNotificationStringForKey:@"santosh is logged in" arguments:nil];
    localNotification.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    
    localNotification.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] +1);
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Time for a run!" content:localNotification trigger:trigger];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    center.delegate = self;
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"Notification created");
    }];
    
}

- (void)takeActionWithLocalNotification:(UNNotification *)localNotification {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:localNotification.request.content.title message:localNotification.request.content.body preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
    }];
    [alertController addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:^{
        }];
    });
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Notification alert" message:@"This app just sent you a notification, do you want to see it?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ignore = [UIAlertAction actionWithTitle:@"IGNORE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ignore");
    }];
    UIAlertAction *view = [UIAlertAction actionWithTitle:@"SEE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self takeActionWithLocalNotification:notification];
    }];
    
    [alertController addAction:ignore];
    [alertController addAction:view];
    
    [self presentViewController:alertController animated:YES completion:^{
    }];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    [self takeActionWithLocalNotification:response.notification];
}


@end
