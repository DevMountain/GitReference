//
//  GRViewController.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

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
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 40;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, 20)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
    [scrollView addSubview:title];
    
    CGFloat top = topMargin + 20 + margin * 2;
    
    for (int i = 0; i < [[self gitCommands] count]; i++) {
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = [self gitCommands][i][Command];
        [scrollView addSubview:gitCommand];
        
        top += (20 + margin);
        
        CGFloat heightForReference = [self heightForReference:[self gitCommands][i][Reference]];
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = [self gitCommands][i][Reference];
        [scrollView addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
    }
}

- (NSArray *)gitCommands {

    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];

}

- (CGFloat)heightForReference:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                  context:nil];
    
    return bounding.size.height;

}

@end
