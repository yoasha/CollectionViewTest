//
//  MyCollectionViewController.m
//  CollectionViewDemo
//
//  Created by Yoash Adato on 21/03/2022.
//

#import "MyCollectionViewController.h"
#import "MyCollectionReusableViewHeader.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionLayoutListConfiguration *config = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:UICollectionLayoutListAppearancePlain];
    config.headerMode = UICollectionLayoutListHeaderModeSupplementary;
    self.collectionView.collectionViewLayout = [UICollectionViewCompositionalLayout layoutWithListConfiguration:config];

    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewListCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerClass:[MyCollectionReusableViewHeader class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"header"];

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataModel.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataModel.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIListContentConfiguration *config = [((UICollectionViewListCell *)cell) defaultContentConfiguration];
    config.text = [NSString stringWithFormat:@"Cell Title #%ld\nsome info\nsome info\nsome info", (long)indexPath.row];
    cell.contentConfiguration = config;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyCollectionReusableViewHeader *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                         withReuseIdentifier:@"header"
                                                                                                forIndexPath:indexPath];
        header.text = self.dataModel[indexPath.section];
        return header;
    }
    
    return nil;
}

- (NSArray<NSString *> *)indexTitlesForCollectionView:(UICollectionView *)collectionView {
    return self.dataModel;
}

-(NSIndexPath *)collectionView:(UICollectionView *)collectionView indexPathForIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [NSIndexPath indexPathWithIndex:index];
}

@end
