#import <Foundation/Foundation.h>
#import "IBExcelCell.h"
@interface IBExcelSheet : NSObject

@property(nonatomic,assign)NSInteger sheetId;//表id

@property(nonatomic,copy)NSString *sheetName;//表名

@property(nonatomic,strong)NSMutableArray <IBExcelCell *>*cellArray;

/**
 根据 横竖坐标 查找cell
 @param column 竖坐标 例：A、H
 @param row 横坐标 例：1、15
 @param error 错误信息
 @return 单元格数据
 */
-(IBExcelCell *)getCellWithColumn:(NSString *)column row:(NSInteger )row error:(NSError **)error;


/**
 解析单表数据
 @param sheetDic 单表字典
 @param sharedStringsArray 公共字符串数组
 @return sheet里所有cell数组
 */
+(NSMutableArray <IBExcelCell *>*)analysisSheetDataWithSheetDic:(NSDictionary *)sheetDic sharedStringsArray:(NSArray *)sharedStringsArray;

@end
