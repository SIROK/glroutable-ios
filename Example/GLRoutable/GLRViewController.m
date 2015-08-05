//
//  GLRViewController.m
//  GLRoutable
//
//  Created by TABATAKATSUTOSHI on 08/05/2015.
//  Copyright (c) 2015 TABATAKATSUTOSHI. All rights reserved.
//

#import "GLRViewController.h"

@interface GLRViewController ()

@end

@implementation GLRViewController

//called by GLRouter before viewDidLoad event
- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        self.title = @"SAMPLE";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
