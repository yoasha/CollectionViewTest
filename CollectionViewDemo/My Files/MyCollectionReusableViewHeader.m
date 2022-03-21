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

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"MyCollectionReusableViewHeader"
                                                              owner:self
                                                            options:nil];
        self = arrayOfViews[0];
        
        self.backgroundColor = [UIColor systemGray6Color];
        
        UIFont *footnoteFont = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        UIFontDescriptor *fontDescriptor = [footnoteFont.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
        self.label.font = [UIFont fontWithDescriptor:fontDescriptor size:0];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (NSString *)text {
    
    return self.label.text;
}

- (void)setText:(NSString *)value {
    
    self.label.text = value;
}

@end
