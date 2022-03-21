//
//  MyTableViewController.m
//  CollectionViewDemo
//
//  Created by Yoash Adato on 21/03/2022.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    UIListContentConfiguration *config = [cell defaultContentConfiguration];
    config.text = [NSString stringWithFormat:@"Cell Title #%ld\nsome info\nsome info\nsome info", (long)indexPath.row];
    cell.contentConfiguration = config;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.dataModel[section];
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.dataModel;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index;
}

@end
