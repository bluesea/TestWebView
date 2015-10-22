//
//  ViewController.m
//  TestWebView
//
//  Created by pingyandong on 15/10/22.
//  Copyright © 2015年 Abaobao. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品列表";
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://sale.jd.com/app/act/QHLsxB1JeCq.html"]]];

//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - webViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL.absoluteString);
    if ([request.URL.absoluteString hasPrefix:@"openapp.jdmobile://virtual?params="]) {
        NSString *test = [request.URL.absoluteString substringFromIndex:@"openapp.jdmobile://virtual?params=".length];
        NSLog(@"%@",[test stringByRemovingPercentEncoding]);
        
        SecondViewController *secondViewCon = [[SecondViewController alloc] init];
        secondViewCon.params = [test stringByRemovingPercentEncoding];
        [self.navigationController pushViewController: secondViewCon animated:YES];
        return NO;
    }
    
    //获取URL并且做比较，判断是否触发了JS事件，注意有"/"
//    if ([request.mainDocumentURL.relativePath containsString:@"/clicked"]) {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"you click me" message:request.mainDocumentURL.relativePath preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//        
//        [alertController addAction:okAction];
//        [self presentViewController:alertController animated:YES completion:^{
//            
//            
//        }];
//        SecondViewController *secondViewCon = [[SecondViewController alloc] init];
//        [self presentViewController:secondViewCon animated:YES completion:nil];
//
//        return false;
//    }
    return  YES;
}

@end
