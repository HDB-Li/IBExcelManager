#import <Foundation/Foundation.h>
#import "IBExcelModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface IBExcelManager : NSObject

- (NSArray *)analysisExcelFile:(NSURL *)fileUrl maxCount:(NSInteger)maxCount;

@end

NS_ASSUME_NONNULL_END
