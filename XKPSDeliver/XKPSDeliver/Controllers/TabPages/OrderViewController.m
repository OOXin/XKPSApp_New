//
//  OrderViewController.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "OrderViewController.h"
#import "AccountViewController.h"
#import "OrderListCell.h"
#import "OrderRunningCell.h"
#import "OrderListModel.h"
@interface OrderViewController ()<ASTableDelegate,ASTableDataSource>
{
    NSInteger cellCounts;
    NSMutableArray *cellArray;
    BOOL haveMore;
}

@property (nonatomic,strong)ASTableNode *tableNode;

@end

@implementation OrderViewController

- (instancetype)init{
    if (self = [super init]) {
        [self addTableNode];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"OrderList" ofType:@"plist"];
        cellArray = [OrderListModel mj_objectArrayWithFile:path];
    }
    return self;
}

- (void)addTableNode{
    _tableNode = [[ASTableNode alloc]init];
    _tableNode.backgroundColor = ROOT_VIEW_BGCOLOR;
    _tableNode.frame = CGRectMake(0, UI_NAV_BAR_HEIGHT, WIDTH, HEIGHT-UI_TAB_BAR_HEIGHT-UI_NAV_BAR_HEIGHT);
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.tableFooterView = [[UIView alloc]init];
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.node addSubnode:_tableNode];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.titleNavLabel.text = @"订单";
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.bgNvaView.hidden = YES;
}

- (void)push{
    AccountViewController *accountVC = [[AccountViewController alloc]init];
    
    [self.navigationController pushViewController:accountVC animated:YES];
}

- (void)textTouched{
    ALERT_VIEW(@"点击文字");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{

     return cellArray.count+1;
}
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode{
    return 1;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [[OrderRunningCell alloc]initWithData:[[NSObject alloc]init]];
    }else
        return [[OrderListCell alloc]initWithModel:cellArray[indexPath.row-1]];
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AccountViewController *accountVC = [[AccountViewController alloc]init];
    accountVC.titleNavLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:accountVC animated:YES];
}

@end
