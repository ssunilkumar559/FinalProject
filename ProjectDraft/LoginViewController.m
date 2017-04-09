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

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self addAdminName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}

@end
