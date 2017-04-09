//
//  Administrator+CoreDataProperties.m
//  ProjectDraft
//
//  Created by rtuser on 4/9/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "Administrator+CoreDataProperties.h"

@implementation Administrator (CoreDataProperties)

+ (NSFetchRequest<Administrator *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Administrator"];
}

@dynamic adminName;

@end
