//
//  IGLDemoViewController.m
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 8/30/14.
//  Copyright (c) 2014 Galvin Li. All rights reserved.
//

#import "IGLDemoViewController.h"
#import "IGLDropDownMenu.h"

@interface IGLDemoViewController () <IGLDropDownMenuDelegate>

@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) UILabel *textLabel;

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
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Demo1",@"Demo2",@"Demo3",@"Demo4",@"Demo5",@"Demo6",]];
    [segmentedControl setFrame:CGRectMake(10, 25, 300, 30)];
    [segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSelectedSegmentIndex:0];
    [self.view addSubview:segmentedControl];
    
    NSArray *dataArray = @[@{@"image":@"sun.png",@"title":@"Sun"},
                           @{@"image":@"clouds.png",@"title":@"Clouds"},
                           @{@"image":@"snow.png",@"title":@"Snow"},
                           @{@"image":@"rain.png",@"title":@"Rain"},
                           @{@"image":@"windy.png",@"title":@"Windy"},];
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dict = dataArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
    }
    
    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
    self.dropDownMenu.menuText = @"Choose Weather";
    self.dropDownMenu.dropDownItems = dropdownItems;
    self.dropDownMenu.paddingLeft = 15;
    [self.dropDownMenu setFrame:CGRectMake(60, 100, 200, 45)];
    self.dropDownMenu.delegate = self;
    
    // You can use block instead of delegate if you want
    /*
    __weak typeof(self) weakSelf = self;
    [self.dropDownMenu addSelectedItemChangeBlock:^(NSInteger selectedIndex) {
        __strong typeof(self) strongSelf = weakSelf;
        IGLDropDownItem *item = strongSelf.dropDownMenu.dropDownItems[selectedIndex];
        strongSelf.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
    }];
    */
    
    [self setUpParamsForDemo1];
    
    [self.dropDownMenu reloadView];
    
    [self.view addSubview:self.dropDownMenu];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textLabel];
    self.textLabel.text = @"No Selected.";

}

- (void)segmentChanged:(UISegmentedControl*)segment
{
    NSInteger index = segment.selectedSegmentIndex;
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
    [self.dropDownMenu reloadView];
    self.textLabel.text = @"No Selected.";
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
    IGLDropDownItem *item = dropDownMenu.dropDownItems[index];
    self.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
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
