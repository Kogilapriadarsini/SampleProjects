//
//  ARRK_CharacterDetailViewController.m
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharacterDetailViewController.h"
#import "ARRK_WebServiceProtocol.h"
#import "ARRK_WebService.h"
#import "ARRK_ComicsTableViewCell.h"
@interface ARRK_CharacterDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) IBOutlet UIImageView *characterImageView;
@property(nonatomic,weak) IBOutlet UILabel *biographyLbl;
@property(nonatomic,weak) IBOutlet UITableView *comicsListTableView;

@end

@implementation ARRK_CharacterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:self.detailVm.name];
    [self populateData];
    // Do any additional setup after loading the view.
}
-(void)populateData
{
    id<ARRK_WebServiceProtocol> webService = (id<ARRK_WebServiceProtocol>)[ARRK_WebService sharedInstance];
    //TODO: Should use image caching mechanism. Like we can use 3 party libraries like SDWebImage.
    [webService loadImageFromUrl:self.detailVm.thumbnailUrl withCompletionHandler:^(NSError *error, NSData *imageData) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData)
            {
                self.characterImageView.image = [UIImage imageWithData:imageData];
            }
        });
    }];
    self.biographyLbl.text = self.detailVm.biography;
    if ([self.detailVm.listOfComics count] > 0) {
        self.comicsListTableView.hidden = false;
    }
    else
    {
        self.comicsListTableView.hidden = true;
    }
}
#pragma makr - table view delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detailVm.listOfComics count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ARRK_ComicsTableViewCell *cell = (ARRK_ComicsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"comicNameCell"];
    cell.comicName.text = [self.detailVm.listOfComics objectAtIndex:indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
