//
//  ViewController.h
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate>

{
    UIView *oldView;
    UIView *newView;
}

@property (strong, nonatomic) NSMutableArray *productArray;

@property (weak, nonatomic) IBOutlet UIView *myView1;
@property (weak, nonatomic) IBOutlet UIView *myView2;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end

