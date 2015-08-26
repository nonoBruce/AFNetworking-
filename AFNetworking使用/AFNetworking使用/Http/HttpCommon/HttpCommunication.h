//
//  HttpCommunication.h
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpCommunicationResult.h"
#import "HttpUrlHeader.h"




@interface HttpCommunication : NSObject

+ (HttpCommunication *)shareInstance;


- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate;


- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate object:(NSObject*)object;

@end
