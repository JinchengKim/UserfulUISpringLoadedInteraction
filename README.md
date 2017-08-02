# 实用 UISpringLoadedInteraction Category
这是一个通用的UIView的Category，可以很方便地帮助你使用iOS11 Drag&Drop特性里面的UISpringLoadedInteraction。在需要UISpringLoadedInteraction的视图里面导入“UIView+SpringLoading.h”，然后使用```setCanSpringLoaded:```控制是否启动UISpringLoadedInteraction。使用```setHandleViewActivationBlock```来控制视图激活时的进行的动作。



# Userful UISpringLoadedInteraction Category
A category for view which can help you apply the UISpringLoadingInteraction more easily.

UIView+SpringLoading is a category of UIView which can help you implement UISpringLoadedInteraction on your view very easily.

First,you need to import the file in the specific view. Then use you can use the ```setCanSpringLoaded:``` to controll the spring interaction. Finally, if you want to do some other tasks when the view is in activation, you should use the ```setHandleViewActivationBlock``` method.

More details in Demo.
