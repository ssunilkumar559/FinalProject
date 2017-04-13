//
//  CustomCollectionViewCell.h
//  ProjectDraft
//
//  Created by Remotetiger_User on 4/11/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *customCollectionImageView;
@property (weak, nonatomic) IBOutlet UILabel *customCollectionTitle;
@property (weak, nonatomic) IBOutlet UILabel *customCollectionId;
@end
