//
//  MapAnnotation.h
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/12/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, assign)int type;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;


@end
