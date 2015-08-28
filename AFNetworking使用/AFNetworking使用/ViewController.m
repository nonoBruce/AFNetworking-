//
//  ViewController.m
//  AFNetworking使用
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "ViewController.h"
#import "HttpCommunication.h"
#import "MJRefresh.h"

#import "ImageModel.h"
#import "UIImageView+AFNetworking.h"
#import "UIImage+AFNetworking.h"

@interface ViewController ()<HttpResultProtocol> {
    NSInteger _pageIndex ;
}
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic)NSMutableArray *resultItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //上拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadMoreImages:1];
    }];
    [self.tableView.header beginRefreshing];
    _pageIndex = 2;
    
    
    //下拉刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreImages:_pageIndex++];
    }];
    
    
}

- (void)loadMoreImages:(NSInteger )index{
    NSString *indexString = [NSString stringWithFormat:@"%ld",index];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:indexString,@"page", nil];
    NSDictionary *headerDic = [NSDictionary dictionaryWithObjectsAndKeys:@"d3af9d65f351aa30943163dd7af7929c",@"apikey", nil];
    [[HttpCommunication shareInstance] doHttpCommunicationWithType:ctImages delegate:self params:dic headerParams:headerDic];
//    [self performSelector:@selector(handleData) withObject:nil afterDelay:2];

}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

#pragma mark - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    ImageModel *imageModel = self.resultItems[indexPath.row];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:10];
    [imageView setImageWithURL:[NSURL URLWithString:imageModel.imageUrl]];
//    imageView.image = [UIImage imageWithData:<#(NSData *)#>]
    UILabel *label = (UILabel *)[cell viewWithTag:11];
    label.text = imageModel.imageTitle;
    return cell;
}

#pragma mark - request delegate
- (void)requestFinishedSuccess:(HttpCommunicationType )ctType andResult:(HttpCommunicationResult *)result {
    if(result){
        if(!self.resultItems) {
            self.resultItems = [NSMutableArray array];
        }
        
        [self.resultItems addObjectsFromArray: result.returnData];
        [self.tableView reloadData];
        
        [self.tableView.footer endRefreshing];
        [self.tableView.header endRefreshing];

    }
    NSLog(@"requestFinishedSuccess");
}

- (void)requestFinishedError:(HttpCommunicationType )ctType andResult:(HttpCommunicationResult *)result {
    
    NSLog(@"requestFinishedError");
}

@end

