//
//  ViewController.m
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataStack.h"
#import "Product+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
}

-(void) getData
{
    
    CoreDataStack *cds = [CoreDataStack sharedStack];
    [cds persistentContainer];
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:cds.persistentContainer.viewContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [cds.persistentContainer.viewContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        //
    }else{
        
        self.productArray = [[NSMutableArray alloc] init];

        [self.productArray addObjectsFromArray:fetchedObjects];
        
    }
    
    [self.tableView reloadData];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated

{
    
    [self.productArray removeAllObjects];
    [self getData];
    [self.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Product *product = [self.productArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@ ", product.pName, product.pPrice];
    
    return cell;
    
}




- (IBAction)switchViewPressed:(UIBarButtonItem *)sender {
    
    
    
    UIViewAnimationOptions transition;
    if (self.myView1.superview) { // view 1 is already visible
        newView = self.myView2;
        oldView = self.myView1;
        
        transition = UIViewAnimationOptionTransitionFlipFromRight;
    } else { // view 2 is visible
        
        newView = self.myView1;
        oldView = self.myView2;
        transition = UIViewAnimationOptionTransitionFlipFromLeft;
    }
    
    
    [UIView transitionFromView:newView toView:oldView duration:.1 options:transition completion:^(BOOL finished) {
        [UIView transitionFromView:oldView toView:newView duration:.2 options:transition completion:nil];
    }];
    

}



@end
