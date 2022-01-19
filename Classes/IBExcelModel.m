#import "IBExcelModel.h"

@implementation IBExcelModel

- (instancetype)initWithSymbol:(NSString *)symbol secType:(NSString *)secType exchange:(NSString *)exchange primaryExchange:(NSString *)primaryExchange currency:(NSString *)currency cap:(NSString *)cap action:(NSString *)action {
    if (self = [super init]) {
        self.symbol = symbol;
        self.secType = secType;
        self.exchange = exchange;
        self.primaryExchange = primaryExchange;
        self.currency = currency;
        self.cap = cap;
        self.action = action;
    }
    return self;
}

@end
