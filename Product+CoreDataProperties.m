//
//  Product+CoreDataProperties.m
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/10/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "Product+CoreDataProperties.h"

@implementation Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Product"];
}

@dynamic pName;
@dynamic pPrice;
@dynamic pImage;

@end
