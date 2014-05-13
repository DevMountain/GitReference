//
//  GRViewController.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 10;

@interface GRViewController ()

@end

@implementation GRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Note: In this case, view.bounds is the same as view.frame. However, oftentimes the bounds will have an origin that is (0,0) whereas the frame will not.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 40;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, 20)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
    [scrollView addSubview:title];
    
}

@end
