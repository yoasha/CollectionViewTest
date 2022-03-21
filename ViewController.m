//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Yoash Adato on 21/03/2022.
//

#import "ViewController.h"
#import "MyCollectionViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)tableViewPressed:(id)sender {
    MyTableViewController *vc = [[MyTableViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.dataModel = [self dataModel];
    vc.title = @"UITableViewController";

    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)collectionViewPressed:(id)sender {
    MyCollectionViewController *vc = [[MyCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    vc.dataModel = [self dataModel];
    vc.title = @"UICollectionViewController";
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray<NSString *> *)dataModel {
    return @[@"0", @"1", @"2", @"3", @"4"];
}


@end
