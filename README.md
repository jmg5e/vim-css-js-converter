# vim-css-js-converter

Convert lines from javascript(json)/react camelcase style to css hyphen case and vice versa

## CssToJs

convert css hyphen case to camel case, replaces semicolon with comma
***
Before
```
background-color: #fffff;
```
After
```
backgroundColor: '#fffff',
```


## JsToCss

convert camel case to hyphencase, replaces comma with semicolon and removes quotes
***
Before
```
backgroundColor: '#fffff';
```
After
```
background-color: #fffff;
```
