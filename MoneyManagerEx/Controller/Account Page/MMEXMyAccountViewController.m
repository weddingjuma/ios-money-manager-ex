//
//  MMEXMyAccountViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/7.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXMyAccountViewController.h"
#import "MMEXMyAccountTableViewCell.h"
#import "CurrentUserBasicInfoViewController.h"
#import "MyBankAccountListViewController.h"
#import "TransactionTypeListViewController.h"
#import "CurrencyTypeListViewController.h"


#define ACCOUNT_TABLE_SECTION_NUM 2
#define ACCOUNT_TABLE_SECTION_ONE_HEGITH 64
#define ACCOUNT_TABLE_SECTION_TWO_HEGITH 36

@interface MMEXMyAccountViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *accountTableView;

@end

@implementation MMEXMyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"My Account", nil);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return 1;
    }
    else if(1 == section) {
        return 3;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reUseIdentifier = (indexPath.section == 0) ? @"MeBasicInfoCellIdentifier" : @"MeOtherInfoCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
    if (nil == cell && (0 == indexPath.section)) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MMEXMyAccountTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    else if (nil == cell && (1 == indexPath.section)) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (0 == indexPath.section) {
        MMEXMyAccountTableViewCell *basicInfoCell = (MMEXMyAccountTableViewCell *)cell;
        basicInfoCell.myAvatar.image = nil;
        basicInfoCell.myName.text = @"嘻哈小混混";
    }
    else if (1 == indexPath.section){
        switch (indexPath.row) {
            case 0:
            {
                cell.textLabel.text = NSLocalizedString(@"My Bank Accounts List", nil);
            }
                break;
            case 1:
            {
                cell.textLabel.text = NSLocalizedString(@"Transaction Type List", nil);
            }
                break;
            case 2:
            {
                cell.textLabel.text =  NSLocalizedString(@"Currency type List", nil);
            }
                break;
            default:
                break;
        }
        [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ACCOUNT_TABLE_SECTION_NUM;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section) {
        return 90;
    }
    else {
        return 60;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((0 == indexPath.section) && (0 == indexPath.row)) {
        CurrentUserBasicInfoViewController *basicInfoVC = [[CurrentUserBasicInfoViewController alloc] initWithNibName:@"CurrentUserBasicInfoViewController" bundle:nil];
        basicInfoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:basicInfoVC animated:YES];
        
    }
    else if ((1 == indexPath.section) && (0 == indexPath.row)) {
        MyBankAccountListViewController *myBankAccountList = [[MyBankAccountListViewController alloc] initWithNibName:@"MyBankAccountListViewController" bundle:nil];
        myBankAccountList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myBankAccountList animated:YES];
    }
    else if ((1 == indexPath.section) && (1 == indexPath.row)) {
        TransactionTypeListViewController *transactionTypeList = [[TransactionTypeListViewController alloc] initWithNibName:@"TransactionTypeListViewController" bundle:nil];
        transactionTypeList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:transactionTypeList animated:YES];
    }
    else if ((1 == indexPath.section) && (2 == indexPath.row)) {
        CurrencyTypeListViewController *currencyTypeList = [[CurrencyTypeListViewController alloc] initWithNibName:@"CurrencyTypeListViewController" bundle:nil];
        currencyTypeList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:currencyTypeList animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
