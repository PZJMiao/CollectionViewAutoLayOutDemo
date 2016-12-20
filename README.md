# CollectionViewAutoLayOutDemo
## UICollectionView 高度自适应
- 图文混搭，图片高度可自适应，文字内容高度可自适应（宽度适应的事例这里面还没有写，以后再补充）
- 只有文字时高度自适应
### 主要代码
```
#pragma mark - flowlayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{//自适应的高度   

    NSString *type = [self getType];
    LayoutModel *model = self.dataArray[indexPath.row];
    CGFloat width;
    if (type == TYPE_TEXTANDIMG) {//图文
        width = SCREEN_WIDTH-20;
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath fixedWidth:width configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }else if(type == TYPE_TEXTLAYOUTHEIGHT){//只有文字
        width = SCREEN_WIDTH;
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath fixedWidth:width configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }else{//只有图片，可实现瀑布流
        return [collectionView ar_sizeForCellWithIdentifier:type indexPath:indexPath configuration:^(__kindof id cell) {
            [cell filleCellWithFeed:model];
        }];
    }
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

```
![1](https://raw.githubusercontent.com/PZJMiao/CollectionViewAutoLayOutDemo/master/screenshot/1.png)
![2](https://github.com/PZJMiao/CollectionViewAutoLayOutDemo/blob/master/screenshot/2.png)

