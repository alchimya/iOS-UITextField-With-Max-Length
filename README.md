# iOS-UITextField-With-Max-Length
A subclass of UITextField with a maxLength property
<br/>

# How to use

```objective-c
 
  //import header file
  #import "L3SDKTextField.h"
  
  //define your IBOutlet
  @interface MyViewController ()
    @property (weak, nonatomic) IBOutlet L3SDKTextField *myTextField;
  @end
 
 //set maxLenght and (if you want) delegate properties
 
 - (void)viewDidLoad {
    [super viewDidLoad];
    //set delegate and maxLength
    self.myTextField.delegate=self;
    self.myTextField.maxLength=2;
}
 
```
