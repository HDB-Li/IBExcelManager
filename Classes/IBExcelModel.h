#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IBExcelModel : NSObject

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, copy) NSString *secType;
@property (nonatomic, copy) NSString *exchange;
@property (nonatomic, copy) NSString *primaryExchange;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *action;

- (instancetype)initWithSymbol:(NSString *)symbol
                       secType:(NSString *)secType
                      exchange:(NSString *)exchange
               primaryExchange:(NSString *)primaryExchange
                      currency:(NSString *)currency
                        action:(NSString *)action;

@end

NS_ASSUME_NONNULL_END
