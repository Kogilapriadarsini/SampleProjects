//
//  ARRK_CharacterTableViewCell.m
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharacterTableViewCell.h"
#import "ARRK_WebServiceProtocol.h"
#import "ARRK_WebService.h"
@interface ARRK_CharacterTableViewCell()
@property (nonatomic) NSUInteger uniqueId;
@end
@implementation ARRK_CharacterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)refreshCellWithData:(ARRK_CharacterTableViewCellVm *)vm
{
    self.characterNameLbl.text = vm.name;
    self.uniqueId = vm.uniqueId;
    self.characterImageView.image = nil;
    NSURL *imgURL = [NSURL URLWithString:vm.thumbnailUrl];
    id<ARRK_WebServiceProtocol> webService = (id<ARRK_WebServiceProtocol>)[ARRK_WebService sharedInstance];
    //TODO: Should use image caching mechanism. Like we can use 3 party libraries like SDWebImage.
    [webService loadImageFromUrl:imgURL withCompletionHandler:^(NSError *error, NSData *imageData) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData && (self.uniqueId == vm.uniqueId))
            {
                self.characterImageView.image = [UIImage imageWithData:imageData];
            }
        });
    }];
}
@end
