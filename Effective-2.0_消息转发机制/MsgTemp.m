/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//  MsgTemp.m
//  Effective-2.0_消息转发机制
//
//  Created by 刘一峰 on 2017/7/17.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MsgTemp.h"
#import <objc/message.h>
#import "SpareClass.h"


/**
 NOTE: 消息转发
 1:当接受的消息无法解读时，会自动调用所属类的以下方法
    +(BOOL)resolveInstanceMethod:(SEL)selector;
 */


@implementation MsgTemp

//参数是无法解读的类方法“targetMethod”
+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}
/**
 没有找到SEL的IML实现时会执行下方的方法
 @param sel 当前对象调用并且找不到IML的SEL
 @return 找到其他的执行方法，并返回yes(当返回NO时，会接着执行forwordingTargetForSelector:方法)
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    Method method = class_getInstanceMethod(self, @selector(dynamicAddMethod:));
//    IMP methodIMP = method_getImplementation(method);
//    const char *types = method_getTypeEncoding(method);
//    class_addMethod(self, sel, methodIMP, types);
    return  NO;
}

//备选接受者
//---当前接受者第二次机会处理未解读的方法
    //运行期系统会询问是否可以转交其它接受者处理。
    //若找到当前接受者的备援接受者，则返回，反之为nil。（可以模拟多继承的特性）
    //
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"%@",NSStringFromSelector(aSelector));
//    return [SpareClass new];
    return nil;
}

- (void)dynamicAddMethod:(NSString *)value {
    NSLog(@"消息转发---动态添加的方法");
}

//完整的消息转发
//这个函数和后面的forwardInvocation:这个函数让重载方有机会抛出一个函数的签名，再由后面的forwardInvocation:去执行。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    //查找父类的方法签名
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if(signature == nil) {
        //@@:有返回值，有一个参数
        signature = [NSMethodSignature signatureWithObjCTypes:"@@:@"];
    }
    return signature;
}

//为解读的方法的所有信息(方法SEl,所有参数,目标Target)
//这个方法中的实现方式很简单，调用 - (void)invokeWithTarget:(id)target; 类似于备援接受者，所以很少使用，一般我们x修改消息内容，，比如追加一个参数，更改方法，等等
- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSString *key = NSStringFromSelector([anInvocation selector]);
//    SEL sel = anInvocation.selector;
    [anInvocation invokeWithTarget:[SpareClass new]];
    //替换方法
//    if ([anInvocation.target respondsToSelector:@selector(methodOne)]) {
//        [anInvocation.target performSelector:@selector(methodOne) withObject:nil];
//    }

    
}
- (void)methodOne {
    NSLog(@"消息重定向----替换方法");
}
@end
