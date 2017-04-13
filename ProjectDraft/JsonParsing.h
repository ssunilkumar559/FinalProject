//
//  JsonParsing.h
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/10/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParsing : NSObject

//@property(strong, nonatomic)NSString *title;
//@property(strong, nonatomic)NSString *poster;
//@property(strong, nonatomic)NSString *imdbID;

//@property(strong, nonatomic)NSMutableArray *array;

-(void) getJsonParsing:(void (^)(NSDictionary *))callback;

@end
