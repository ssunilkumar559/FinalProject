//
//  AddingViewController.m
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "AddingViewController.h"
#import "CoreDataStack.h"
#import "MapAnnotation.h"

@interface AddingViewController ()

@end

@implementation AddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDetailImageView];
    [self updateDetailTitle];
    [self updateDetailImdbId];
    
    //MapView
    self.manager = [[CLLocationManager alloc]init];
    self.manager.delegate = self;
    
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    else {
        [self.manager requestAlwaysAuthorization];
    }
 
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [self.latParse doubleValue];
    coordinate.longitude = [self.longitParse doubleValue];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.02, 0.02));
    
    
    [self.mymap setRegion:region];
    
    //pin
    
    MapAnnotation *ann = [[MapAnnotation alloc]init];
    ann.coordinate = coordinate;
    ann.title = [NSString stringWithFormat:@"%@",self.pinNameMsg];
    ann.type = 1;
    ann.subtitle = [NSString stringWithFormat:@"%@",self.pinSubNameMsg];
    [self.mymap addAnnotation:ann];
    
    
    

    
//    NSMutableArray *coordinates = [NSMutableArray array];
//    for(int i=0; i< [self.latParse count]; i++){
//        double latitude = [self.latParse[i] doubleValue];
//        double longitude = [self.longitParse[i] doubleValue];
//        
//        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
//        [coordinates addObject:[NSValue valueWithMKCoordinate:coordinate]];
//    }
//    NSLog(@"coordinates array = %@", coordinates);
//    
}



-(void)updateDetailImageView{
    if (self.imageViewMsg != nil) {
        self.detailImageView.image = self.imageViewMsg;
    }
}

-(void)updateDetailTitle{
    if (self.detailTitle != nil) {
        self.detailTitle.text = self.titleMsg;
    }
}
    
-(void)updateDetailImdbId{
    if (self.detailImdbId != nil) {
        self.detailImdbId.text = self.imdbIdMsg;
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Location Updated");
        
    }
    
}



@end
