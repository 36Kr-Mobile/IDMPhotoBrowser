//
//  IDMPageControl.m
//  IDMPhotoBrowser
//
//  Created by 小普 on 15/5/8.
//
//

#import "IDMPageControl.h"

@interface IDMPageControl ()

@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation IDMPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.hidesForSinglePage = YES;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (!self.pageControl.hidden) { // 避免 page control hidesForSinglePage时，self单独显示
        CGSize pageControlSize = [self.pageControl sizeForNumberOfPages:self.pageControl.numberOfPages];
        self.pageControl.bounds = CGRectMake(0, 0, pageControlSize.width, pageControlSize.height);

        CGFloat selfWidth = pageControlSize.width + 20;
        CGFloat selfHeight = pageControlSize.height / self.pageControl.numberOfPages + 8;

        self.bounds = CGRectMake(0, 0, selfWidth, selfHeight);
        self.layer.cornerRadius = selfHeight / 2.0;
        self.pageControl.center = CGPointMake(selfWidth / 2.0, selfHeight / 2.0);
    }
}

#pragma mark - Setter

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    self.pageControl.numberOfPages = numberOfPages;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    self.pageControl.currentPage = currentPage;
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
    self.pageControl.hidesForSinglePage = hidesForSinglePage;
}

#pragma mark - Getter

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    }
    return _pageControl;
}

- (NSInteger)numberOfPages
{
    return self.pageControl.numberOfPages;
}

- (NSInteger)currentPage
{
    return self.pageControl.currentPage;
}

- (BOOL)hidesForSinglePage
{
    return self.pageControl.hidesForSinglePage;
}

@end
