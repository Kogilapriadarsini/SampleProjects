//
//  ViewController.m
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharactersListViewController.h"
#import "ARRK_CharacterTableViewCell.h"
#import "ARRK_CharactersListVm.h"
#import "ARRK_CharacterDetailViewController.h"
static NSString *reusableCellIdentifer = @"characterCell";
@interface ARRK_CharactersListViewController () <ARRK_CharactersListVmDelegate>
@property (nonatomic,weak) IBOutlet UITableView *listTableView;
@property (nonatomic,strong)  ARRK_CharactersListVm *listVm;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic,weak) IBOutlet UILabel *noResultsLbl;
@property (nonatomic) NSIndexPath *selectedIndexPath;
@end

@implementation ARRK_CharactersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listVm = [[ARRK_CharactersListVm alloc] initWithDelegate:self];
    //TODO: Add reachability class and check the network status before makeing a server call and show appropriate error.
    [self.listVm fetchCharactersList];
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidesWhenStopped:true];
    [self.listTableView setHidden:true];
    [self.noResultsLbl setHidden:true];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Tableview delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listVm dataCount];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ARRK_CharacterTableViewCell *cell = (ARRK_CharacterTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reusableCellIdentifer];
    [cell refreshCellWithData:[self.listVm characterCellVmWithIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"showDetailScreen" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:false];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showDetailScreen"])
    {
        // Get reference to the destination view controller
        ARRK_CharacterDetailViewController *vc = [segue destinationViewController];
        vc.detailVm = [[ARRK_CharacterDetailsVm alloc] initWithCharacter:[self.listVm characterAtIndex:self.selectedIndexPath.row]];
        self.selectedIndexPath = nil;
    }
}
#pragma mark - ARRK_CharactersListVmDelegate methods
-(void)didFinishFetchingCharacters
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.listVm dataCount] > 0)
        {
            [self.listTableView setHidden:false];
            [self.listTableView reloadData];
            [self.noResultsLbl setHidden:true];
        }
        else
        {
            [self.listTableView setHidden:true];
            [self.noResultsLbl setHidden:false];
        }
        [self.activityIndicator stopAnimating];
    });
}
- (void)didFailFetchingCharacterWithError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Something went wrong" message:@"Do want to try again?" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.listVm fetchCharactersList];
            
        }]];
        [alertView addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alertView dismissViewControllerAnimated:true completion:nil];
            [self.noResultsLbl setHidden:false];
            [self.activityIndicator stopAnimating];

        }]];
        [self presentViewController:alertView animated:true completion:nil];
    });
    
}
@end
