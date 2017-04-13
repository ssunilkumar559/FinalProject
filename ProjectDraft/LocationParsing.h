//
//  LocationParsing.h
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/12/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationParsing : NSObject

-(void) getLocationParsing:(void (^)(NSMutableDictionary *))callbacklocation;

@end
