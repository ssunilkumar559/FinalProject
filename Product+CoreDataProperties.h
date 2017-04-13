//
//  Product+CoreDataProperties.h
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/10/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import "Product+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *pName;
@property (nullable, nonatomic, copy) NSString *pPrice;
@property (nullable, nonatomic, copy) NSString *pImage;

@end

NS_ASSUME_NONNULL_END
