//
//  ARRK_CharacterTableViewCell.h
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARRK_CharacterTableViewCellVm.h"
@interface ARRK_CharacterTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *characterImageView;
@property (nonatomic, weak) IBOutlet UILabel *characterNameLbl;
- (void)refreshCellWithData:(ARRK_CharacterTableViewCellVm *)vm;
@end
