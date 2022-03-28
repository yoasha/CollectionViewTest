//
//  MyCollectionViewController.m
//  CollectionViewDemo
//
//  Created by Yoash Adato on 21/03/2022.
//

#import "MyCollectionViewController.h"
#import "MyCollectionReusableViewHeader.h"

@interface MyCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionLayoutListConfiguration *config = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:UICollectionLayoutListAppearancePlain];
    config.headerMode = UICollectionLayoutListHeaderModeSupplementary;

    
    UICollectionViewCompositionalLayout *layout = [UICollectionViewCompositionalLayout layoutWithListConfiguration:config];
    self.collectionView.collectionViewLayout = layout;

    // Register cell class
    [self.collectionView registerClass:[UICollectionViewListCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Register header class
    UINib *XIB = [UINib nibWithNibName:@"MyCollectionReusableViewHeader" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:XIB forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5000;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIListContentConfiguration *config = [((UICollectionViewListCell *)cell) defaultContentConfiguration];
    config.text = [NSString stringWithFormat:@"Row #%ld", (long)indexPath.row];
    cell.contentConfiguration = config;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyCollectionReusableViewHeader *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                         withReuseIdentifier:@"header"
                                                                                                forIndexPath:indexPath];
        [header configureWithText:[NSString stringWithFormat:@"Section #%ld", (long)indexPath.section]];
        return header;
    }

    return nil;
}

- (NSArray<NSString *> *)indexTitlesForCollectionView:(UICollectionView *)collectionView {
    return @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
}

-(NSIndexPath *)collectionView:(UICollectionView *)collectionView indexPathForIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [NSIndexPath indexPathWithIndex:index];
}

@end
