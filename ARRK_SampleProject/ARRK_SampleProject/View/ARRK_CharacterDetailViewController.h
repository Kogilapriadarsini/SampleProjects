//
//  ARRK_CharacterDetailViewController.h
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARRK_CharacterDetailsVm.h"

@interface ARRK_CharacterDetailViewController : UIViewController
//TODO: all vm creation should go to one single place.
@property(nonatomic,strong) ARRK_CharacterDetailsVm *detailVm;

@end

