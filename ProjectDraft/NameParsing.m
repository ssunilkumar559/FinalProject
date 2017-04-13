//
//  NameParsing.m
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/12/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "NameParsing.h"

@implementation NameParsing

-(void) getNameParsing:(void (^)(NSMutableDictionary *))callbacklocation{
    
    NSURL *url = [NSURL URLWithString:@"https://query.yahooapis.com/v1/public/yql?q=show%20tables&format=json&diagnostics=true&callback="];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    __block NSMutableDictionary *nameDict;
    
    NSURLSessionTask *getNameParsingTask = [[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error!=nil){
            NSLog(@"Some error in parsing data");
        }
        else{
            NSLog(@"successfully entered the block");
            NSMutableDictionary *namejson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            nameDict = namejson;
            //NSLog(@"%@", locationjson);
        }
        callbacklocation(nameDict);
        
        
    }];
    [getNameParsingTask resume];
    
}


@end
