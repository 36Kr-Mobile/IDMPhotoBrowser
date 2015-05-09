//
//  IDMPageControl.h
//  IDMPhotoBrowser
//
//  Created by 小普 on 15/5/8.
//
//

#import <UIKit/UIKit.h>

@interface IDMPageControl : UIView

@property(nonatomic) NSInteger numberOfPages;
@property(nonatomic) NSInteger currentPage;
@property(nonatomic) BOOL hidesForSinglePage;

@end
