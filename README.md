IGLDropDownMenu
===============

An iOS drop down menu with pretty animation.

## Screenshot

[![](https://raw.githubusercontent.com/bestwnh/IGLDropDownMenu/master/Screens/IGLDropDownMenuDemo.gif)](https://raw.githubusercontent.com/bestwnh/IGLDropDownMenu/master/Screens/IGLDropDownMenuDemo.gif)

## How To Use

####*!Try the demo. It's really helpful!*

### Sample Code

1. Create your `IGLDropDownItem` array and set up
    ```objc
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
    [item setIconImage:[UIImage imageNamed:@"icon.png"]];
    [item setText:@"title"];
    [dropdownItems addObject:item];
    ```
    
2. Create your `IGLDropDownMenu` and set the up the parameter name `dropDownItems`
    ```objc
    IGLDropDownMenu *dropDownMenu = [[IGLDropDownMenu alloc] init];
    [dropDownMenu setFrame:CGRectMake(0, 0, 200, 45)];
    dropDownMenu.menuText = @"Choose Weather";
    dropDownMenu.menuIconImage = [UIImage imageNamed:@"chooserIcon.png"]];
    dropDownMenu.paddingLeft = 15;  // padding left for the content of the button
    ```

3. modify the params of `IGLDropDownMenu`
    ```objc
    dropDownMenu.type = IGLDropDownMenuTypeStack;
    dropDownMenu.gutterY = 5;
    dropDownMenu.itemAnimationDelay = 0.1;
    dropDownMenu.rotate = IGLDropDownMenuRotateRandom;
    ```

4. Call the `reloadView` method (Very Important!)
    ```objc
    // every time you change the params you should call reloadView method
    [dropDownMenu reloadView];
    ```

### Parameters

These are just some of the parameters you can use, you can find more(or make more) in the code.

####*For `IGLDropDownMenu`*

- `animationDuration` set the duration(s) of the animation in second
- `animationOption` set the UIViewAnimationOptions for the animation
- `itemAnimationDelay` set the delay(s) before each of item start to animate

- `direction` set the direction when the menu expand
> - `IGLDropDownMenuDirectionDown` default value, expand downward
> - `IGLDropDownMenuDirectionUp` expand upward

- `rotate` set the rotate style when the menu on expand
> - `IGLDropDownMenuRotateNone` default value, for no rotate
> - `IGLDropDownMenuRotateLeft` rotate to left on expand
> - `IGLDropDownMenuRotateRight` rotate to right on expand
> - `IGLDropDownMenuRotateRandom` rotate random on expand every single time

- `type` set the menu type (remember when you set the type to SlidingIn* you can't have the rotate type at the same time.)
> - `IGLDropDownMenuTypeNormal` default value, item will hide behind the menu button on fold
> - `IGLDropDownMenuTypeStack` item will hide behind the menu button and make a stack like look
> - `IGLDropDownMenuTypeSlidingInBoth` item will slide in and out from both sides
> - `IGLDropDownMenuTypeSlidingInFromLeft` item will slide in from left
> - `IGLDropDownMenuTypeSlidingInFromRight` item will slide in from right

- `slidingInOffset` set the offset value for the items slide in and out
- `gutterY` set the Y gutter between items
- `alphaOnFold` set the item alpha value when menu on fold, only use this when the style won't fit your mind
- `flipWhenToggleView` when you set this to true, the menu button will flip up when you click
- `useSpringAnimation` use the spring animation for iOS7 or higher version, default is true

####*For `IGLDropDownItem`*

- `iconImage` set the icon image for the item
- `text` set the text string for the item
- `textLabel` for you to adjust the text label style
- `object` you can store your custom item in this preporty

Remember the `menuButton` in `IGLDropDownMenu` is also an `IGLDropDownItem`.

## Requirements

- target platform: >=iOS 6.0 (I never test the version below 6.0, maybe you can make some try and tell me.)
- ARC

## TODO

1. make `IGLDropDownItem` more customizable
2. ~~add the spring animation for iOS 7 or higher version~~
3. add more animation effect for the menu
4. just contact me and tell me more

## Thanks

This drop-down menu idea is come from [here](http://tympanus.net/Development/SimpleDropDownEffects/index.html), I found this demo one day and just implement it on iOS.

## License

The MIT License (MIT)

Copyright (c) 2014 Galvin Li

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
