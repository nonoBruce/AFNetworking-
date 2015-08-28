//
//  HttpImagesRequest.m
//  AFNetworking使用
//
//  Created by bruce on 15/8/27.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpImagesRequest.h"
#import "ImageModel.h"

@interface HttpImagesRequest()

@end

@implementation HttpImagesRequest


- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSDictionary *)params headerParams:(NSDictionary *)headerParams {
    
    NSString *urlString = @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_pic";
    
    
    [self requestWithType:cType delegate:delegate url:urlString params:params headerParams:headerParams httpType:@"GET"];
    
}



//解析
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult {
    httpResult = [[HttpCommunicationResult alloc] init];
    if(dic) {
        NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:10];
        //开始解析
        NSArray *array = [[dic objectForKey:@"showapi_res_body"] objectForKey:@"contentlist"];
        for(NSDictionary *itemDic in array) {
            ImageModel *imageModel = [[ImageModel alloc] init];
            imageModel.imageTitle = [itemDic objectForKey:@"title"];
            imageModel.imageUrl = [itemDic objectForKey:@"img"];
            [resultArray addObject:imageModel];
        }
        
        httpResult.isSuccess = YES;
        httpResult.returnData = resultArray;
    }
    return httpResult;
}


@end
