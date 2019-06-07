# auto_orientation
This plugin was created to programmatically rotate on iOS and Android

## Getting Started

After importing the package you can use:  
`AutoOrientation.landscapeLeftMode();` or   
`AutoOrientation.landscapeRightMode();` or  
`AutoOrientation.portraitDownMode();` (might not work) or  
`AutoOrientation.portraitUpMode();` or   
`AutoOrientation.portraitAutoMode();` or  
`AutoOrientation.landscapeAutoMode();` or  
`AutoOrientation.fullAutoMode();`

No need to call `SystemChrome.setPreferredOrientations` because
it has been added to the library itself.  
This has been done because before android auto-rotation wasn't
working after setting rotation using the plugin.

We've used it for a VideoScaffold, to programmatically change to landscape
and back to portrait if the scaffold is disposed.

## Example

Please have a look in the `example/` folder