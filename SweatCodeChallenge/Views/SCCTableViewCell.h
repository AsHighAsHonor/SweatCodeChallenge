//
//  SCCTableViewCell.h
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCCProgram;


NS_ASSUME_NONNULL_BEGIN

@interface SCCTableViewCell : UITableViewCell
-(void)setupCell:(SCCProgram *)program;
@end

NS_ASSUME_NONNULL_END
