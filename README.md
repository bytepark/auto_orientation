# auto_orientation
This plugin was created to programmatically rotate on iOS and Android

## Getting Started

After importing the package you can use
`AutoOrientation.landscapeLeftMode();` or
`AutoOrientation.landscapeRightMode();` or
`AutoOrientation.portraitUpMode();`

There is a method `AutoOrientation.portraitDownMode();`
which currently is not working, but it seems that this is a more general os issue.

We've used it for a VideoScaffold, to programmatically change to landscape
and back to portrait if the scaffold is disposed.

## Example

Please have a look in the `example/` folder
