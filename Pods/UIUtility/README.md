### 背景
- 代码方式布局通常会写很多代码，使整个布局结构看起来比较凌乱且写起很繁琐，可以通过Category方式对系统常用控件的接口进行封装，使创建或设置这些控件变得很简单，很容易，代码很整齐，达到意想不到的结果！

### 对Button和Label的封装
- 详见代码如下
```
+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color;

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor;

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title backgroundColor:(UIColor *)backColor;

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color;

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor;

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title backgroundColor:(UIColor *)backColor;

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color normalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle;

```

```
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color;

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text;

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor;

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor;

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment;

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment;
```
这样创建Button和Label会变得非常简单，一行代码将搞定！

- 一行代码设置按钮的Image和Title对齐方式，不再受imageEdgeInsets和titleEdgeInsets的困扰
```
- (void)layoutWithStyle:(LYButtonLayoutStyle)style andSpacing:(CGFloat)spacing

```

```
- (void)layoutWithStyle:(LYButtonLayoutStyle)style andSpacing:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    switch (style) {
        case LYButtonLayoutStyleImagePositionTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing) / 2, titleSize.width / 2, (titleSize.height + spacing) / 2, -(titleSize.width / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height + spacing) / 2, -(imageSize.width / 2), -(imageSize.height + spacing) / 2, imageSize.width / 2);
        }
            break;
            
        case LYButtonLayoutStyleImagePositionBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake((titleSize.height + spacing) / 2, titleSize.width / 2, -(titleSize.height + spacing) / 2, -(titleSize.width / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + spacing) / 2, -(imageSize.width / 2), (imageSize.height + spacing) / 2, imageSize.width / 2);
        }
            break;
            
        case LYButtonLayoutStyleImagePositionLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -(spacing / 2), 0.0, spacing / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, spacing / 2, 0.0, -(spacing / 2));
        }
            break;
            
        case LYButtonLayoutStyleImagePositionRight: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing / 2, 0.0, -(titleSize.width + spacing / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -(imageSize.width + spacing / 2), 0.0, (imageSize.width + spacing / 2));
        }
            break;
        default:
            break;
    }
}
```
#### 更多封装详见代码，可以通过 pod 'UIUtility' 导入工程

![capture pictrue](https://github.com/lazyycz/CommonlyUtility/blob/master/CommonlyUtilityDemo/Snapshots/capture.jpg)

### 注意

- Category里面方法没有加前缀
