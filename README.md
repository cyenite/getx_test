# Getx Test

`getx_test` is a package that provides testing utilities for GetX, a powerful state management library for Flutter.  
Based on [get_test](https://pub.dev/packages/get_test) library.

## Installation

Add the following dependency to your `pubspec.yaml` file:



    dependencies:  
	    getx_test: ^1.0.3


## Usage
-----  

Import the required packages and create a test case using the `getTest` method. Inside the `widgetTest` callback, use the `expect` method to test your GetX app's behavior.


    import 'package:flutter/material.dart';  
    import 'package:flutter_test/flutter_test.dart';  
    import 'package:get/get.dart';  
    import 'package:getx_test/getx_test.dart';  
      
    void main() {  
	    getTest(  
	    "test description",  
	    widgetTest: (tester) async {  
		    expect('/', Get.currentRoute);  
		    
		    Get.to(Container()); 
		    expect('/Container', Get.currentRoute);  
		    
		    Get.to(Scaffold()); 
		    expect('/Scaffold', Get.currentRoute);  
		    
		    Get.back();  
		    expect('/Container', Get.currentRoute); 
		});  
    }


You can also use `testGetX`, `testGetBuilder`, and `testObx` to test specific GetX widgets:



    testGetX(  
      'GetX test',  
      widget: GetX<Controller>(  
        init: Controller(),  
        builder: (controller) {  
          return Text("Clicks:${controller.count}");  
        },  
      ),  
      test: (e) {  
        expect(find.text("Clicks:0"), findsOneWidget);  
        expect(e.count.value, 0);  
      },  
    );

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    testGetBuilder(  
      'GetBuilder test',  
      widget: GetBuilder<Controller>(  
        init: Controller(),  
        builder: (controller) {  
          return Text("Clicks:${controller.count}");  
        },  
      ),  
      test: (e) {  
        expect(find.text("Clicks:0"), findsOneWidget);  
        expect(e.count.value, 0);  
      },  
    );

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    testObx(  
      'Obx test',  
      widget: (controller) => Obx(  
        () => Text("Clicks:${controller.count}"),  
      ),  
      controller: Controller(),  
      test: (e) {  
        expect(find.text("Clicks:0"), findsOneWidget);  
        expect(e.count.value, 0);  
      },  
    ); 


Finally, you can test your `GetxController` instances with `testController`:



    testController<Controller>(  
      'Controller test',  
      (controller) {
		  //Write your controller arrangements, actions and assertions here...
	  },  
      controller: Controller(),  
      onInit: (c) {  
        c.increment();  
        print('onInit');  
      },  
      onReady: (c) {  
        print('onReady');  
        c.increment();  
      },  
      onClose: (c) {  
        print('onClose');  
      },  
    );


Examples
--------  

For more examples of how to use `get_test`, check out the official [example repository](https://github.com/cyenite/getx_test/example/lib/main.dart) or the [official documentation](https://pub.dev/packages/getx_test).

Conclusion
----------  

`getx_test` is a great tool for testing GetX applications in Flutter. With this package, you can easily test your widgets, controllers, and routes to make sure your app works as expected.
