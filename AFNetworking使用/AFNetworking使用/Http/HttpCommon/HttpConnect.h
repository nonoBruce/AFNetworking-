//
//  HttpConnect.h
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpUrlHeader.h"
#import "HttpCommunicationResult.h"
#import "AFNetworking.h"

@protocol HttpConnectDelegate<NSObject>

- (void)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult;

@end


@interface HttpConnect : NSObject<HttpConnectDelegate>


//自己用
- (void)getRequest:(NSURL *)url andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType )cType;


//子类用
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult;


//子类用
- (void)requestWithObject:(id)object andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType) cType;

@end
