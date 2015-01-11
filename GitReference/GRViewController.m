//
//  GRViewController.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat heightForLabel = 20;
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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 20;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, heightForLabel)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
    [scrollView addSubview:title];
    
    CGFloat top = topMargin + heightForLabel + margin * 2;
    
    for (NSDictionary *gitCommand in [self gitCommands]) {

        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForLabel)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (heightForLabel + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        [scrollView addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);

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

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                  context:nil];
    
    return bounding.size.height;

}

@end
