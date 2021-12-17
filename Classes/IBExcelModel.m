#import "IBExcelModel.h"

@implementation IBExcelModel

- (instancetype)initWithSymbol:(NSString *)symbol secType:(NSString *)secType exchange:(NSString *)exchange primaryExchange:(NSString *)primaryExchange currency:(NSString *)currency action:(NSString *)action totalQuantity:(NSInteger)totalQuantity orderType:(NSString *)orderType {
    if (self = [super init]) {
        self.symbol = symbol;
        self.secType = secType;
        self.exchange = exchange;
        self.primaryExchange = primaryExchange;
        self.currency = currency;
        self.action = action;
        self.totalQuantity = totalQuantity;
        self.orderType = orderType;
    }
    return self;
}

@end