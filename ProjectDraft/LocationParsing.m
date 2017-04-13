//
//  LocationParsing.m
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/12/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "LocationParsing.h"

@implementation LocationParsing

-(void) getLocationParsing:(void (^)(NSMutableDictionary *))callbacklocation{
    
    NSURL *url = [NSURL URLWithString:@"http://ergast.com/api/f1/2008/drivers/alonso/results.json"];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    __block NSMutableDictionary *locationDict;
    
    NSURLSessionTask *getLocationParsingTask = [[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error!=nil){
            NSLog(@"Some error in parsing data");
        }
        else{
            NSLog(@"successfully entered the block");
            NSMutableDictionary *locationjson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            locationDict = locationjson;
            //NSLog(@"%@", locationjson);
        }
        callbacklocation(locationDict);
        
        
    }];
    [getLocationParsingTask resume];
    
}

@end
