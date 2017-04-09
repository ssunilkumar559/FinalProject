//
//  Administrator+CoreDataProperties.h
//  ProjectDraft
//
//  Created by rtuser on 4/9/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "Administrator+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Administrator (CoreDataProperties)

+ (NSFetchRequest<Administrator *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *adminName;

@end

NS_ASSUME_NONNULL_END
