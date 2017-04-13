//
//  AddingViewController.h
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface AddingViewController : UIViewController< CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *manager;


@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UITextField *detailTitle;
@property (weak, nonatomic) IBOutlet UITextField *detailImdbId;

@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) UIImage *imageViewMsg;
@property (strong, nonatomic) NSString *titleMsg;
@property (strong, nonatomic) NSString *imdbIdMsg;

@property (strong, nonatomic) NSString *latParse;
@property (strong, nonatomic) NSString *longitParse;

@property (strong, nonatomic) NSString *pinNameMsg;
@property (strong, nonatomic) NSString *pinSubNameMsg;

@property (weak, nonatomic) IBOutlet MKMapView *mymap;


@end
