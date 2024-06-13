//
//  KeyUtil.m
//  JumioTest
//
//  Created by Blake on 2024/6/12.
//

#import "KeyUtil.h"

#import <openssl/sm2.h>
#import <openssl/bn.h>
#import <openssl/evp.h>
#import <openssl/asn1t.h>
#import <openssl/crypto.h>

static int kDefaultEllipticCurveType = NID_secp256k1;

@implementation KeyUtil

+ (NSString *)generateKeypair {
    NSString * pubStr = @"";
    NSString * priStr = @"";
    
    EC_GROUP *group = EC_GROUP_new_by_curve_name(kDefaultEllipticCurveType); // 椭圆曲线
    EC_KEY *key = NULL;
    do {
        key = EC_KEY_new();
        if (!EC_KEY_set_group(key, group)) {
            break;
        }
        if (!EC_KEY_generate_key(key)) {
            break;
        }
        const EC_POINT *pub_key = EC_KEY_get0_public_key(key);
        const BIGNUM *pri_key = EC_KEY_get0_private_key(key);
        char *hex_pub = EC_POINT_point2hex(group, pub_key, POINT_CONVERSION_COMPRESSED, NULL);
        char *hex_pri = BN_bn2hex(pri_key);
        NSString *pubHex = [NSString stringWithCString:hex_pub encoding:NSUTF8StringEncoding];
        NSString *priHex = [NSString stringWithCString:hex_pri encoding:NSUTF8StringEncoding];
        if (pubHex.length > 0 && priHex.length > 0) {
            pubStr = pubHex;
            priStr = priHex;
        }
        OPENSSL_free(hex_pub);
        OPENSSL_free(hex_pri);
    } while (NO);
    
    if (group != NULL) EC_GROUP_free(group);
    EC_KEY_free(key);
    
    return [NSString stringWithFormat:@"%@ - %@", pubStr, priStr];
}

@end
