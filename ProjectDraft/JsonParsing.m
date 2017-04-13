//
//  JsonParsing.m
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/10/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "JsonParsing.h"

@implementation JsonParsing

-(void) getJsonParsing:(void (^)(NSDictionary *))callback{
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.omdbapi.com/?s=Batman&page=2"];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    __block NSDictionary *plotString;
    
    NSURLSessionTask *getUrlSessionTask = [[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error!=nil){
            NSLog(@"Some error in parsing data");
        }
        else{
            NSLog(@"successfully entered the block");
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
           plotString = json;
        }
        callback(plotString);
        
        
    }];
    [getUrlSessionTask resume];

}

@end
