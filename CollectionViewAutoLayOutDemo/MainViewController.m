//
//  MainViewController.m
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import "MainViewController.h"
#import "UICollectionView+ARDynamicCacheHeightLayoutCell.h"
#import "LayoutModel.h"
#import "TextAndImageCell.h"
#import "TextLayoutHeightCell.h"
#import "ImageCell.h"

static NSString* const TYPE_TEXTANDIMG = @"TextAndImageCell";
static NSString* const TYPE_TEXTLAYOUTHEIGHT = @"TextLayoutHeightCell";
static NSString* const TYPE_IMAGE = @"ImageCell";

/** 屏幕宽高 */
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MainViewController

#pragma mark - lifeCycle                    - Method -
- (void)dealloc
{
    NSLog(@"VC -> dealloc");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"collection Layout";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:16];
    self.navigationItem.titleView = title;
    
    [self.collectionView registerNib:[UINib nibWithNibName:TYPE_TEXTANDIMG bundle:nil] forCellWithReuseIdentifier:TYPE_TEXTANDIMG];
    [self.collectionView registerNib:[UINib nibWithNibName:TYPE_TEXTLAYOUTHEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_TEXTLAYOUTHEIGHT];
    [self.collectionView registerNib:[UINib nibWithNibName:TYPE_IMAGE bundle:nil] forCellWithReuseIdentifier:TYPE_IMAGE];

    NSArray *titles = @[@"11",
                        @"222",
                        @"3333",
                        @"444",
                        @"55",
                        @"66",
                        @"777"];
    NSArray *contents = @[@"[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];",
                          @"[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];",
                          @"[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];",
                          @"11111111111111111111111122222222222222222222222222222222222333333333333333333333[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];[self.collectionView registerNib:[UINib nibWithNibName:TYPE_HEIGHT bundle:nil] forCellWithReuseIdentifier:TYPE_HEIGHT];",
                          @"123456789098765432123455667890886543231232545754trfe546457y5t",
                    @"asddadffrfgdfgfhbcvnhghjbfgbfgjgnd1231242342354645t543rdfest456rfdvdyerdsgdf",
                          @"wwwedscdsfgdvcxv cgtvtryik;cldpsfopw, cefioejrdakscmijkdhhjwchxriuw≈¥unjhvudcfzmc;vp[oderpskvpokreiosjadixqwneyui ∆¬˚fjueyhwai˚∂¬…åßkcdji eoaod"];
    
    NSArray *images = @[[UIImage imageNamed:@"11"],
                        [UIImage imageNamed:@"22"],
                        [UIImage imageNamed:@"33"],
                        [UIImage imageNamed:@"44.jpg"],
                        [UIImage imageNamed:@"55"],
                        [UIImage imageNamed:@"66.jpg"],
                        [UIImage imageNamed:@"77"]];
    
    for (int i = 0; i < contents.count; i++) {
        LayoutModel *feed = [[LayoutModel alloc] init];
        feed.title = titles[i];
        feed.content = contents[i];
        feed.image = images[i];
        [self.dataArray addObject:feed];
    }
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - eventResponse                - Method -

#pragma mark - notification                 - Method -

#pragma mark - privateMethods               - Method -

- (NSString *)getType
{
    NSString *str = @"";
    if ([self.comeFrom isEqualToString:@"图文"]) {
        str = TYPE_TEXTANDIMG;
    }else if ([self.comeFrom isEqualToString:@"文字"]){
        str = TYPE_TEXTLAYOUTHEIGHT;
    }else if ([self.comeFrom isEqualToString:@"image"]){
        str = TYPE_IMAGE;
    }
    return str;
}
#pragma mark - customDelegate               - Method -

#pragma mark - objective-cDelegate          - Method -
#pragma mark - flowlayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *type = [self getType];
    LayoutModel *model = self.dataArray[indexPath.row];
    CGFloat width;
    if (type == TYPE_TEXTANDIMG) {
        width = SCREEN_WIDTH-20;
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath fixedWidth:width configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }else if(type == TYPE_TEXTLAYOUTHEIGHT){
        width = SCREEN_WIDTH;
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath fixedWidth:width configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }else{
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    NSString *type = [self getType];
    if (type == TYPE_TEXTANDIMG) {
        return 10;
    }else if(type == TYPE_TEXTLAYOUTHEIGHT){
        return 1;
    }else{
        return 1;
    }
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *type = [self getType];
    if (type == TYPE_TEXTANDIMG) {
        TextAndImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:type forIndexPath:indexPath];
        if (self.dataArray.count>0) {
            LayoutModel *model = self.dataArray[indexPath.row];
            [cell filleCellWithFeed:model];
        }
        return cell;
    }else if(type == TYPE_TEXTLAYOUTHEIGHT){
        TextLayoutHeightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:type forIndexPath:indexPath];
        if (self.dataArray.count>0) {
            LayoutModel *model = self.dataArray[indexPath.row];
            [cell filleCellWithFeed:model];
        }
        return cell;
    }else{
        ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:type forIndexPath:indexPath];
        if (self.dataArray.count>0) {
            LayoutModel *model = self.dataArray[indexPath.row];
            [cell filleCellWithFeed:model];
        }
        return cell;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - getters and setters          - Method -
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 0;
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        
    }
    return _collectionView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
