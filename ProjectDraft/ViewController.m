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
#import "JsonParsing.h"
#import "CustomCollectionViewCell.h"
#import "AddingViewController.h"
#import "LocationParsing.h"
#import "NameParsing.h"



@interface ViewController (){
    NSDictionary *jsondict;
    NSDictionary *locdict;
    NSDictionary *namedictionary;
    NSMutableArray *titleArray;
    NSMutableArray *posterArray;
    NSMutableArray *imdbidArray;
    NSMutableArray *latArray;
    NSMutableArray *longArray;
    NSMutableArray *pinArray;
    NSMutableArray *pinSubArray;
    
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
 
    //json parsing
    jsondict = [[NSDictionary alloc]init];
    
    titleArray = [[NSMutableArray alloc]init];
    posterArray = [[NSMutableArray alloc]init];
    imdbidArray = [[NSMutableArray alloc]init];
    

    
    JsonParsing *json = [[JsonParsing alloc] init];
    //dispatch_queue_t queue = dispatch_get-dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [json getJsonParsing:^(NSDictionary *plotstring) {
        jsondict = plotstring;
        
        NSDictionary *search = [jsondict objectForKey:@"Search"];
        for (NSDictionary *temp in search) {
            
            NSDictionary *titledict = [temp objectForKey:@"Title"];
            [titleArray addObject:titledict];
            //NSLog(@"%@", titleArray);
            
            NSDictionary *poster = [temp objectForKey:@"Poster"];
            [posterArray addObject:poster];
            //NSLog(@"%@", posterArray);
            
            NSDictionary *imdbID = [temp objectForKey:@"imdbID"];
            [imdbidArray addObject:imdbID];
            
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.myCollectionView reloadData];
        });
       
    }];
    
    locdict = [[NSDictionary alloc]init];
    
    latArray =[[NSMutableArray alloc]init];
    longArray =[[NSMutableArray alloc]init];

    
    LocationParsing *locationParsing = [[LocationParsing alloc]init];
    
    [locationParsing getLocationParsing:^(NSMutableDictionary *locationDict) {
        locdict = locationDict;
        
        NSDictionary *races = [[[locdict objectForKey:@"MRData"]objectForKey:@"RaceTable"]objectForKey:@"Races"];
        
        for(NSDictionary *temp in races){
            NSString *lat = [[[temp objectForKey:@"Circuit"]objectForKey:@"Location"]objectForKey:@"lat"];
            
            [latArray addObject:lat];
            
            
            NSString *longit = [[[temp objectForKey:@"Circuit"]objectForKey:@"Location"]objectForKey:@"long"];
        
            [longArray addObject:longit];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.myCollectionView reloadData];
        });
        
    }];
    
    namedictionary = [[NSDictionary alloc]init];
    
    pinArray = [[NSMutableArray alloc]init];
    pinSubArray = [[NSMutableArray alloc]init];
    
    NameParsing *nameparsing = [[NameParsing alloc]init];
    
    [nameparsing getNameParsing:^(NSMutableDictionary *nameDict) {
        namedictionary = nameDict;
        
        NSDictionary *ainfo = [[[namedictionary objectForKey:@"query"]objectForKey:@"results"]objectForKey:@"table"];
        for (NSDictionary *temp in ainfo) {
            NSString *pinname = [temp objectForKey:@"security"];
            [pinArray addObject:pinname];
            NSString *pinsubname = [temp objectForKey:@"content"];
            [pinSubArray addObject:pinsubname];
        }
    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
   
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ ",[titleArray objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ ",[imdbidArray objectAtIndex:indexPath.row]];
    
    NSURL *url = [NSURL URLWithString:[posterArray objectAtIndex:indexPath.row]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return titleArray.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.customCollectionTitle.text = [titleArray objectAtIndex:indexPath.row];
    cell.customCollectionId.text = [imdbidArray objectAtIndex:indexPath.row];
    
    
    NSURL *url = [NSURL URLWithString:[posterArray objectAtIndex:indexPath.row]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.customCollectionImageView.image = [UIImage imageWithData:data];
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detail"])
    {
    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];

        AddingViewController *segueObject = segue.destinationViewController;
        segueObject.msg = [titleArray objectAtIndex:indexpath.row];
        segueObject.title = segueObject.msg;

        segueObject.titleMsg = [titleArray objectAtIndex:indexpath.row];
        segueObject.imdbIdMsg = [imdbidArray objectAtIndex:indexpath.row];
        
        NSURL *url = [NSURL URLWithString:[posterArray objectAtIndex:indexpath.row]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        segueObject.imageViewMsg = [UIImage imageWithData:data];
        segueObject.latParse = [latArray objectAtIndex:indexpath.row];
        segueObject.longitParse = [longArray objectAtIndex:indexpath.row];
        segueObject.pinNameMsg = [pinArray objectAtIndex:indexpath.row];
    segueObject.pinSubNameMsg = [pinSubArray objectAtIndex:indexpath.row];
    }
}

@end
