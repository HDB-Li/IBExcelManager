#import <Foundation/Foundation.h>

@class IBExcelCell;

@interface IBExcelCell : NSObject

@property(nonatomic,strong)NSDictionary *cellDic;//源数据

@property(nonatomic,assign)NSInteger stringValueIndex;//值在公共字符串的下标

@property(nonatomic,copy)NSString *stringValue;//单元格字符串值

@property(nonatomic,strong)NSString *column;//单元格列

@property(nonatomic,assign)NSInteger row;//单元格行

@property(nonatomic,assign)BOOL indexAnalysisSuccess;



//合并单元格
@property(nonatomic,strong)NSString *mergeCellColumAndRowStr;//合并单元格首行列字符串

@property(nonatomic,assign)BOOL cellIsMerge;//单元格是否是合并单元格

@property(nonatomic,strong)NSString *mergeColumn;//合并单元格首列

@property(nonatomic,assign)NSInteger mergeRow;//合并单元格首行


/**
 获取字符串内数字
 */
+(NSString *)getNumberFromStr:(NSString *)str;



/**
 获取字符串内字母
 */
+(NSString *)getLetterFromStr:(NSString *)str;

@end
