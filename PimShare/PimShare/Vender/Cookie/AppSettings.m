//
//  AppSettings.m
//  YourMate
//
//  Created by Tang Shilei on 15/6/16.
//  Copyright (c) 2015年 Yourmate. All rights reserved.
//

#import "AppSettings.h"

#define USER_DEFAULT                                [NSUserDefaults standardUserDefaults]

#define SESSIOIN_COOKIES            @"sessionCookies"

#define GET_USERDEFAULT(__key__)                    [USER_DEFAULT objectForKey:__key__]

@implementation AppSettings


+(void)setCookies
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
//    for (NSHTTPCookie *cookie in cookies) {
//        // Here I see the correct rails session cookie
////        NSLog(@"cookie: %@", cookie);
//    }
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: cookies];
    [USER_DEFAULT setObject: cookiesData forKey: @"sessionCookies"];
    [USER_DEFAULT synchronize];
    
}

+(void)httpSetCookies
{
    NSArray *arcCookies = [NSKeyedUnarchiver unarchiveObjectWithData: GET_USERDEFAULT(SESSIOIN_COOKIES)];
    
//    NSArray *arcCookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in arcCookies){
        [cookieStorage setCookie: cookie];
    }
    
}


@end
