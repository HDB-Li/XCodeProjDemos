

## Directory structure

`Origin`: The original demo, I didn't do anything, just for copying to other folders.
`MyLib`: How `my version` does it.
`System`:  how the `system` works
`XCodeproj-1.17.1`: how `Xcodeproj` does it.

## What demo is going to do

Demo demonstrates adding a framework project (named **MyFrameworkProject**) to the main project (named **MainProject**) and referencing it to `Link  Binary With Libraries`.

## Environment configuration

* MacOS: 10.15.3 (19D76)
* Ruby: ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]
* XCodeproj: 1.17.1
* XCode: Version 11.3.1 (11C505)

## Conclusion

In the comparison of the above demo, you can find that the system creates a new group named `Product` under `mainGroup` to store `MyFrameworkProject`, while `XcodeProj` stores `MyFrameworkProject` with the old group which named `Product`. This is the difference between the `System` and `Xcodeproj`. 

#### Xcodeproj will cause crash if this is done. You can try to add header search paths in the mainproject of 'xcodeproj-1.17.1'. When you finish adding, Xcode will crash.

![](/img/1.jpg)

The content point I modified is to create a new group and add it to `maingroup` when adding `.xcodeproj` type files. Instead of directly reusing the old group which named `Project`.

For the `remoteInfo` of the newly added project, you can find that the system uses the name of the target of the subproject instead of using the string `Subproject` directly.


##  The above conclusions can be compared with the `project.pbxproj` in `MainProject.xcodeproj`  To find out.

This is just a modification of this problem. You may need more Xcode version adaptations to compare the differences between different versions of Xcode.
