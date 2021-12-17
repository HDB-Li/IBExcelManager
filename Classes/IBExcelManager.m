#import "IBExcelManager.h"
#import "IBExcelWookbook.h"

@implementation IBExcelManager

- (NSArray *)analysisExcelFile:(NSURL *)fileUrl maxCount:(NSInteger)maxCount {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    IBExcelWookbook *workbook = [[IBExcelWookbook alloc] initWithExcelFilePathUrl:fileUrl];
    
    IBExcelSheet *sheet = workbook.sheetArray.firstObject;
    
    if (!sheet) {
        return result;
    }
    
    for (NSInteger i = 2; i < maxCount + 2; i++) {
        NSString *symbol = [[sheet getCellWithColumn:@"A" row:i error:nil] stringValue];
        NSString *type = [[sheet getCellWithColumn:@"B" row:i error:nil] stringValue];
        NSString *exchange = [[sheet getCellWithColumn:@"C" row:i error:nil] stringValue];
        NSString *primExch = [[sheet getCellWithColumn:@"D" row:i error:nil] stringValue];
        NSString *currency = [[sheet getCellWithColumn:@"E" row:i error:nil] stringValue];
        NSString *action = [[sheet getCellWithColumn:@"F" row:i error:nil] stringValue];
        NSInteger quantity = [[[sheet getCellWithColumn:@"G" row:i error:nil] cellDic][@"v"][@"text"] integerValue];
        NSString *orderType = [[sheet getCellWithColumn:@"H" row:i error:nil] stringValue];
        
        
        IBExcelModel *model = [[IBExcelModel alloc] initWithSymbol:symbol secType:type exchange:exchange primaryExchange:primExch currency:currency action:action totalQuantity:quantity orderType:orderType];
        [result addObject:model];
    }
    
    return result;
}

@end
