//
//  SCCProgramDynamicCell.h
//  SweatCodeChallenge
//
//  Created by YYang1 on 2/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SCCProgram;
@interface SCCProgramDynamicCell : UITableViewCell
-(void)setupCell:(SCCProgram *)program;
@end

NS_ASSUME_NONNULL_END
