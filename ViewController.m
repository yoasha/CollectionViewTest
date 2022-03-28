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
    vc.title = @"UITableViewController";

    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)collectionViewPressed:(id)sender {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    MyCollectionViewController *vc = [[MyCollectionViewController alloc] initWithCollectionViewLayout:layout];
    vc.title = @"UICollectionViewController";
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
