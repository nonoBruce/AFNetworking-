//
//  HttpImagesRequest.h
//  AFNetworking使用
//
//  Created by bruce on 15/8/27.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpConnect.h"

@interface HttpImagesRequest : HttpConnect

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSDictionary *)params headerParams:(NSDictionary *)headerParams;


@end
