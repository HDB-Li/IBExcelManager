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
    
    NSArray *columns = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSString *symbolCol = nil;
    NSString *typeCol = nil;
    NSString *exchangeCol = nil;
    NSString *primExchCol = nil;
    NSString *currencyCol = nil;
    NSString *actionCol = nil;
    NSString *quantityCol = nil;
    NSString *orderTypeCol = nil;
    
    for (NSInteger i = 0; i <= 1; i++) {
        for (NSString *col in columns) {
            if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"symbol"]) {
                symbolCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"type"]) {
                typeCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"exchange"]) {
                exchangeCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"prim exch"]) {
                primExchCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"currency"]) {
                currencyCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"action"]) {
                actionCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"quantity"]) {
                quantityCol = col;
            } else if ([[[sheet getCellWithColumn:col row:i error:nil] stringValue].lowercaseString isEqualToString:@"order type"]) {
                orderTypeCol = col;
            }
        }
    }
    
    if (!symbolCol || !typeCol || !exchangeCol || !primExchCol || !currencyCol || !actionCol || !quantityCol || !orderTypeCol) {
        return result;
    }
    
    for (NSInteger i = 2; i < maxCount + 2; i++) {
        NSString *symbol = [[sheet getCellWithColumn:symbolCol row:i error:nil] stringValue];
        NSString *type = [[sheet getCellWithColumn:typeCol row:i error:nil] stringValue];
        NSString *exchange = [[sheet getCellWithColumn:exchangeCol row:i error:nil] stringValue];
        NSString *primExch = [[sheet getCellWithColumn:primExchCol row:i error:nil] stringValue];
        NSString *currency = [[sheet getCellWithColumn:currencyCol row:i error:nil] stringValue];
        NSString *action = [[sheet getCellWithColumn:actionCol row:i error:nil] stringValue];
        NSInteger quantity = [[[sheet getCellWithColumn:quantityCol row:i error:nil] cellDic][@"v"][@"text"] integerValue];
        NSString *orderType = [[sheet getCellWithColumn:orderTypeCol row:i error:nil] stringValue];
        
        if (symbol.length && type.length && exchange.length && primExch.length && currency.length && action.length && quantity && orderType.length) {
            IBExcelModel *model = [[IBExcelModel alloc] initWithSymbol:symbol secType:type exchange:exchange primaryExchange:primExch currency:currency action:action totalQuantity:quantity orderType:orderType];
            [result addObject:model];
        }
    }
    
    return result;
}

@end
