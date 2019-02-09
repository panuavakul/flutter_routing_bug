# Minimal Test Case for Router Handler keep getting called

## Issue
https://github.com/theyakka/fluro/issues/57

## Step to reproduce
1) Put breakpoint in the handler function

2) Run the project and route to the `MyOtherPage` with `FloatingActionButton`

3) Tap on the `TextFormField` and it should call the breakpoint.