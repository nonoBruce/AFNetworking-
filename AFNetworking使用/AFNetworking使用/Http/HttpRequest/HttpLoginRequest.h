//
//  HttpLoginRequest.h
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpConnect.h"
@interface HttpLoginRequest : HttpConnect

//- (void)getRequest:(NSDictionary *)dic andDelegate:(id<HttpResultProtocol>)delegate
//           andType:(HttpCommunicationType) cType;

- (void)requestWithObject:(id)object andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType) cType;
@end
