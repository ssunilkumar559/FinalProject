//
//  Product+CoreDataProperties.m
//  ProjectDraft
//
//  Created by Hasibul Shishir on 4/8/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "Product+CoreDataProperties.h"

@implementation Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Product"];
}

@dynamic pName;
@dynamic pPrice;

@end
