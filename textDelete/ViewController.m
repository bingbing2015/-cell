//
//  ViewController.m
//  textDelete
//
//  Created by Linjiasong_Mac on 15/7/30.
//  Copyright (c) 2015年 Linjiasong_Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (strong, nonatomic) IBOutlet UITableView *myTableview;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.dataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
  self.myTableview.delegate = self;
  self.myTableview.dataSource = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self.dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *RootViewControllerCell = @"RootViewControllerCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RootViewControllerCell];
  if(cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RootViewControllerCell];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"shibai_144"] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(280, 10, 30, 30)];
    [button addTarget:self action:@selector(del:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
  }
  
  cell.textLabel.text = [self.dataArray objectAtIndex:[indexPath row]];
  cell.tag = [indexPath row];
  
  NSArray *subviews = [cell.contentView subviews];
  for(id view in subviews)
  {
    if([view isKindOfClass:[UIButton class]])
    {
      [view setTag:[indexPath row]];
      [cell.contentView bringSubviewToFront:view];
    }
  }
  return cell;
}
-(void)del:(UIButton *)button
{
  NSArray *visiblecells = [self.myTableview visibleCells];
  for(UITableViewCell *cell in visiblecells)
  {
    if(cell.tag == button.tag)
    {
      [self.dataArray removeObjectAtIndex:[cell tag]];
      [self.myTableview reloadData];
      break;
    }
  }
}


@end
