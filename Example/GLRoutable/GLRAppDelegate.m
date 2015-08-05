//
//  GLRAppDelegate.m
//  GLRoutable
//
//  Created by TABATAKATSUTOSHI on 08/05/2015.
//  Copyright (c) 2015 TABATAKATSUTOSHI. All rights reserved.
//

#import "GLRAppDelegate.h"
#import "GLRViewController.h"
#import <GLRoutable/Routable.h>

@implementation GLRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    [[Routable sharedRouter] map:@"test/:id/:name" toController:[GLRViewController class]];
    [[Routable sharedRouter] map:@"callbacktest/:id/:name" toCallback:^(NSDictionary *params) {
        NSString *id = [params objectForKey:@"id"];
        NSString *value = [params objectForKey:@"name"];
        NSString *paramValue = [params objectForKey:@"key"];
    }];
    [[Routable sharedRouter] setRootUrl:@"glroutable://"];
    [[Routable sharedRouter] setNavigationController:nav];
    
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    
//    [[Routable sharedRouter] open:@"callbacktest/1234/gl?key=value&k=v"];
//    [[Routable sharedRouter] open:@"test/1234/sirok?gl=value&k=v"];
    /*
     you can test by serching "glroutable://test/1234/sirok?gl=value&k=v" on safari
     */

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    [[Routable sharedRouter] openUrl:url];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
