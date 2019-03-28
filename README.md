# auto_orientation
** iOS only currently **

This plugin was created to programmatically rotate on iOS

## Getting Started

After importing the package you can use
`AutoOrientation.landscapeMode();` or
`AutoOrientation.portraitMode();`

I've used it for the a VideoScaffold, to programmatically change to landscape
and back to portrait if the scaffold is disposed.

``` 
class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeMode();
    super.initState();
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AutoOrientation.portraitMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
```
