//
//  HttpCommunicationResult.h
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpUrlHeader.h"



//结果数据类型
@interface HttpCommunicationResult : NSObject

@property(nonatomic, assign) BOOL isSuccess;
@property(nonatomic, strong) id returnData;
@property(nonatomic, strong) id successMessage;
@property(nonatomic, strong) id errorMessage;


@end


//结果回调函数
@protocol HttpResultProtocol <NSObject>

- (void)requestFinishedSuccess:(HttpCommunicationType )ctType andResult:(HttpCommunicationResult *)result;

- (void)requestFinishedError:(HttpCommunicationType )ctType andResult:(HttpCommunicationResult *)result;

@end