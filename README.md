# vim-css-js-converter

Convert lines from javascript(json)/react camelcase style to css hyphen case and vice versa

## CssToJs

<details>
<summary>Behaviour & usage</summary>

### Behaviour

convert css hyphen case to camel case, replaces semicolon with comma. **Note that this assumes 1
`property: value` pair per line.**

Before
```
background-color: #fffff;
```
After
```
backgroundColor: '#fffff',
```
---

### Usage

#### In command mode

```
:CssToJs
```

converts the line under your cursor

#### In visual mode

For multiple lines

```
:'<,'>CssToJS
```

Note that `:'<,'>` refers to the currently-selected region, and will automatically come up when you're in visual mode and press `:`.

</details>

## JsToCss

<details>
<summary>Behaviour & usage</summary>

### Behaviour

convert camel case to hyphencase, replaces comma with semicolon and removes quotes. **Note that this
assumes 1 `property: value` pair per line.**

Before
```
backgroundColor: '#fffff';
```
After
```
background-color: #fffff;
```
---

### Usage

#### In command mode

```
:JsToCss
```

converts the line under your cursor

#### In visual mode

For multiple lines

```
:'<,'>JsToCss
```

Note that `:'<,'>` refers to the currently-selected region, and will automatically come up when you're in visual mode and press `:`.

</details>
