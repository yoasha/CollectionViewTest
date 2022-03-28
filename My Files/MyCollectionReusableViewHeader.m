//
//  MyCollectionReusableViewHeader.m
//  CollectionViewDemo
//
//  Created by Yoash Adato on 21/03/2022.
//

#import "MyCollectionReusableViewHeader.h"

@interface MyCollectionReusableViewHeader ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyCollectionReusableViewHeader

#pragma mark - Initialization

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor systemGray6Color];
}

- (void)configureWithText:(NSString *)text {
    self.label.text = text;
}

@end
