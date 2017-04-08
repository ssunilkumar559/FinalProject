//
//  CoreDataStack.h
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject


@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


+(CoreDataStack *) sharedStack;
@end
