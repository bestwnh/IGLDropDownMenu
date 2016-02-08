//
//  IGLDemoViewController.m
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 8/30/14.
//  Copyright (c) 2014 Galvin Li. All rights reserved.
//

#import "IGLDemoViewController.h"
#import "IGLDemoCustomView.h"
#import "IGLDropDownMenu.h"

@interface IGLDemoViewController () <IGLDropDownMenuDelegate>

@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) UISegmentedControl *segmentControl;

@property (nonatomic, strong) IGLDropDownMenu *defaultDropDownMenu;
@property (nonatomic, strong) IGLDropDownMenu *customeViewDropDownMenu;

@end

@implementation IGLDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Demo1",@"Demo2",@"Demo3",@"Demo4",@"Demo5",@"Demo6"]];
    [segmentedControl setFrame:CGRectMake(10, 25, 300, 30)];
    [segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSelectedSegmentIndex:0];
    [self.view addSubview:segmentedControl];
    self.segmentControl = segmentedControl;
    
    UISegmentedControl *segmentedControl2 = [[UISegmentedControl alloc] initWithItems:@[@"Default",@"CustomView",]];
    [segmentedControl2 setFrame:CGRectMake(10, 65, 300, 30)];
    [segmentedControl2 addTarget:self action:@selector(segment2Changed:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl2 setSelectedSegmentIndex:0];
    [self.view addSubview:segmentedControl2];
    
    self.dataArray = @[@{@"image":[UIImage imageNamed:@"sun.png"],@"title":@"Sun"},
                       @{@"image":[UIImage imageNamed:@"clouds.png"],@"title":@"Clouds"},
                       @{@"image":[UIImage imageNamed:@"snow.png"],@"title":@"Snow"},
                       @{@"image":[UIImage imageNamed:@"rain.png"],@"title":@"Rain"},
                       @{@"image":[UIImage imageNamed:@"windy.png"],@"title":@"Windy"}];
    
    [self initDefaultMenu];
    [self initCustomViewMenu];
    
    self.customeViewDropDownMenu.hidden = YES;
    self.dropDownMenu = self.defaultDropDownMenu;
    
    [self setUpParamsForDemo1];
    
    [self.dropDownMenu reloadView];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 320, 50)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textLabel];
    self.textLabel.text = @"No Selected.";

}

- (void)initDefaultMenu
{
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.dataArray.count; i++) {
        NSDictionary *dict = self.dataArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setIconImage:dict[@"image"]];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
    }
    
    self.defaultDropDownMenu = [[IGLDropDownMenu alloc] init];
    self.defaultDropDownMenu.menuText = @"Choose Weather";
    self.defaultDropDownMenu.dropDownItems = dropdownItems;
    self.defaultDropDownMenu.paddingLeft = 15;
    [self.defaultDropDownMenu setFrame:CGRectMake(60, 140, 200, 45)];
    self.defaultDropDownMenu.delegate = self;
    
    [self.view addSubview:self.defaultDropDownMenu];
    
    [self.defaultDropDownMenu reloadView];
}

- (void)initCustomViewMenu
{
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.dataArray.count; i++) {
        NSDictionary *dict = self.dataArray[i];
        
        IGLDemoCustomView *customView = [[IGLDemoCustomView alloc] init];
        customView.image = dict[@"image"];
        customView.title = dict[@"title"];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] initWithCustomView:customView];
        [dropdownItems addObject:item];
    }
    
    IGLDemoCustomView *customView = [[IGLDemoCustomView alloc] init];
    
    self.customeViewDropDownMenu = [[IGLDropDownMenu alloc] initWithMenuButtonCustomView:customView];
    self.customeViewDropDownMenu.dropDownItems = dropdownItems;
    [self.customeViewDropDownMenu setFrame:CGRectMake(135, 140, 50, 50)];
    self.customeViewDropDownMenu.delegate = self;
    
    [self.view addSubview:self.customeViewDropDownMenu];
    
    [self.customeViewDropDownMenu reloadView];
    
    __weak typeof(self) weakSelf = self;
    [self.customeViewDropDownMenu addSelectedItemChangeBlock:^(NSInteger selectedIndex) {
        __strong typeof(self) strongSelf = weakSelf;
        IGLDropDownItem *item = strongSelf.dropDownMenu.dropDownItems[selectedIndex];
        IGLDemoCustomView *selectedView = (IGLDemoCustomView*)item.customView;
        IGLDropDownItem *menuButton = strongSelf.dropDownMenu.menuButton;
        IGLDemoCustomView *buttonView = (IGLDemoCustomView*)menuButton.customView;
        buttonView.image = selectedView.image;
        strongSelf.textLabel.text = [NSString stringWithFormat:@"Selected: %@", selectedView.title];
    }];
}

- (void)segmentChanged:(UISegmentedControl*)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    [self setUpParameWithSegmentControlIndex:index];
    [self.dropDownMenu reloadView];
    self.textLabel.text = @"No Selected.";
}

- (void)setUpParameWithSegmentControlIndex:(NSInteger)index
{
    [self.dropDownMenu resetParams];
    switch (index) {
        case 0:
            // Demo 1
            [self setUpParamsForDemo1];
            break;
        case 1:
            // Demo 2
            [self setUpParamsForDemo2];
            break;
        case 2:
            // Demo 3
            [self setUpParamsForDemo3];
            break;
        case 3:
            // Demo 4
            [self setUpParamsForDemo4];
            break;
        case 4:
            // Demo 5
            [self setUpParamsForDemo5];
            break;
        case 5:
            // Demo 6
            [self setUpParamsForDemo6];
            break;
        default:
            break;
    }
}


- (void)segment2Changed:(UISegmentedControl*)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    if (index == 0) {
        self.customeViewDropDownMenu.hidden = YES;
        self.dropDownMenu = self.defaultDropDownMenu;
    } else {
        self.defaultDropDownMenu.hidden = YES;
        self.dropDownMenu = self.customeViewDropDownMenu;
    }
    self.dropDownMenu.hidden = NO;
    [self setUpParameWithSegmentControlIndex:self.segmentControl.selectedSegmentIndex];
    self.textLabel.text = @"No Selected.";
    [self.dropDownMenu reloadView];

}

- (void)setUpParamsForDemo1
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.gutterY = 5;
}

- (void)setUpParamsForDemo2
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.gutterY = 5;
    self.dropDownMenu.itemAnimationDelay = 0.1;
    self.dropDownMenu.rotate = IGLDropDownMenuRotateRandom;
}

- (void)setUpParamsForDemo3
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.gutterY = 5;
    self.dropDownMenu.itemAnimationDelay = 0.04;
    self.dropDownMenu.rotate = IGLDropDownMenuRotateLeft;
}

- (void)setUpParamsForDemo4
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.flipWhenToggleView = YES;
}

- (void)setUpParamsForDemo5
{
    self.dropDownMenu.gutterY = 5;
    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
}

- (void)setUpParamsForDemo6
{
    self.dropDownMenu.gutterY = 5;
    self.dropDownMenu.type = IGLDropDownMenuTypeSlidingInBoth;
    self.dropDownMenu.itemAnimationDelay = 0.1;
}

#pragma mark - IGLDropDownMenuDelegate

- (void)dropDownMenu:(IGLDropDownMenu *)dropDownMenu selectedItemAtIndex:(NSInteger)index
{
    if (self.dropDownMenu == self.defaultDropDownMenu) {
        IGLDropDownItem *item = dropDownMenu.dropDownItems[index];
        self.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
    }
    
}

- (void)dropDownMenu:(IGLDropDownMenu *)dropDownMenu expandingChanged:(BOOL)isExpending
{
    NSLog(@"Expending changed to: %@", isExpending? @"expand" : @"fold");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
