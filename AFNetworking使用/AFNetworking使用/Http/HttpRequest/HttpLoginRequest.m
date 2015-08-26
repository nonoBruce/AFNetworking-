//
//  HttpLoginRequest.m
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpLoginRequest.h"

@implementation HttpLoginRequest



- (void)requestWithObject:(id)object andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType) cType {
    
    NSURL *url = [NSURL URLWithString:@"http://httpbin.org/get"];
    [self getRequest:url andDelegate:delegate andType:cType];
}


//解析
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult {
    
    
    return httpResult;
}
@end
