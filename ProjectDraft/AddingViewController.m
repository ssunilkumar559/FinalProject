//
//  AddingViewController.m
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "AddingViewController.h"
#import "CoreDataStack.h"
#import "Product+CoreDataProperties.h"

@interface AddingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextField *productPrice;

@end

@implementation AddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addItems:(UIButton *)sender

{
    NSString *productName = self.productName.text;
    NSString *productPrice = self.productPrice.text;
    
    CoreDataStack *cds = [CoreDataStack sharedStack];
    [cds persistentContainer];
    
    
    Product *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:cds.persistentContainer.viewContext];
    
    product.pName = productName;
    product.pPrice = productPrice;
    
    [cds saveContext];
    
}


@end
