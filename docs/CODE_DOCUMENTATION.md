# Code Documentation

This document provides detailed documentation for all custom code files in the Climate Processes and Predictability Research Group website.

## Table of Contents

- [JavaScript Files](#javascript-files)
  - [custom.js](#customjs)
  - [mathjax-config.js](#mathjax-configjs)
  - [wowchemy-slides.js](#wowchemy-slidesjs)
- [SCSS Files](#scss-files)
  - [custom.scss](#customscss)
- [Configuration Files](#configuration-files)
  - [_headers](#_headers)
  - [_redirects](#_redirects)
  - [manifest.webmanifest](#manifestwebmanifest)

---

## JavaScript Files

### custom.js

**File Location**: `assets/js/custom.js`  
**Purpose**: Custom JavaScript functionality for website interactions  
**Dependencies**: None (vanilla JavaScript)

#### Global Variables

```javascript
var slideIndex = 0;
```
- **Type**: `number`
- **Purpose**: Tracks the current slide position in the slideshow
- **Initial Value**: 0 (first slide)

#### Functions

##### `showSlides()`

**Purpose**: Manages automatic slideshow functionality with navigation dots

**Algorithm**:
1. Hides all slides by setting `display: none`
2. Increments slide index
3. Resets to first slide if at end
4. Removes active class from all dots
5. Shows current slide and activates corresponding dot
6. Schedules next slide change after 2 seconds

**Parameters**: None  
**Returns**: None  
**Side Effects**: 
- Modifies DOM elements' display properties
- Updates CSS classes on navigation dots
- Schedules recursive calls

**Usage Example**:
```html
<!-- HTML Structure Required -->
<div class="slideshow-container">
  <div class="mySlides">
    <img src="image1.jpg" alt="Slide 1">
  </div>
  <div class="mySlides">
    <img src="image2.jpg" alt="Slide 2">
  </div>
  <div class="mySlides">
    <img src="image3.jpg" alt="Slide 3">
  </div>
  
  <!-- Navigation dots -->
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
</div>

<script src="assets/js/custom.js"></script>
```

**Browser Compatibility**: All modern browsers (ES5 compatible)

---

### mathjax-config.js

**File Location**: `js/mathjax-config.js`  
**Purpose**: Configuration for MathJax mathematical rendering  
**Dependencies**: MathJax v3.x

#### Configuration Object

```javascript
window.MathJax = {
  options: { ... },
  tex: { ... },
  loader: { ... }
}
```

#### Options

##### `options.ignoreHtmlClass`
- **Type**: `string`
- **Value**: `'markmap'`
- **Purpose**: Prevents MathJax from rendering math in markmap elements

#### TeX Configuration

##### `tex.inlineMath`
- **Type**: `Array<Array<string>>`
- **Values**: `[['$', '$'], ['\\(', '\\)']]`
- **Purpose**: Defines delimiters for inline mathematical expressions

##### `tex.displayMath`
- **Type**: `Array<Array<string>>`
- **Values**: `[['$$', '$$'], ['\\[', '\\]']]`
- **Purpose**: Defines delimiters for display mathematical expressions

##### `tex.processEscapes`
- **Type**: `boolean`
- **Value**: `false`
- **Purpose**: Disables processing of escaped characters

##### `tex.packages`
- **Type**: `Object`
- **Value**: `{'[+]': ['noerrors']}`
- **Purpose**: Loads the noerrors package for better error handling

#### Loader Configuration

##### `loader.load`
- **Type**: `Array<string>`
- **Value**: `['[tex]/noerrors']`
- **Purpose**: Specifies which TeX packages to load

#### Usage Examples

**Inline Math**:
```markdown
The quadratic formula is $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$
```

**Display Math**:
```markdown
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$
```

**Alternative Syntax**:
```markdown
Inline: \(E = mc^2\)

Display: \[F = G\frac{m_1 m_2}{r^2}\]
```

---

### wowchemy-slides.js

**File Location**: `js/wowchemy-slides.js`  
**Purpose**: Presentation functionality using Reveal.js  
**Dependencies**: Reveal.js, Mermaid (optional)

#### Configuration

##### `slides` Object
```javascript
var slides = { 
  highlight_style: "dracula", 
  theme: "black" 
};
```

##### `enabledPlugins` Array
```javascript
var enabledPlugins = [
  RevealMarkdown, 
  RevealSearch, 
  RevealNotes, 
  RevealMath.KaTeX, 
  RevealZoom
];
```

#### Utility Functions

##### `isObject(o)`
- **Purpose**: Checks if value is a plain object
- **Parameters**: `o` - value to check
- **Returns**: `boolean`

##### `isArray(a)`
- **Purpose**: Checks if value is an array
- **Parameters**: `a` - value to check
- **Returns**: `boolean`

##### `toCamelCase(s)`
- **Purpose**: Converts kebab-case/snake_case to camelCase
- **Parameters**: `s` - string to convert
- **Returns**: `string`

##### `keysToCamelCase(o)`
- **Purpose**: Recursively converts object keys to camelCase
- **Parameters**: `o` - object to process
- **Returns**: `object`

#### Mermaid Integration

##### `renderMermaidDiagrams(event)`
- **Purpose**: Renders Mermaid diagrams on slide changes
- **Parameters**: `event` - Reveal.js event object
- **Side Effects**: Modifies DOM, calls Mermaid API

#### Usage

**Basic Slide Structure**:
```html
<div class="reveal">
  <div class="slides">
    <section>
      <h1>Title</h1>
      <p>Content</p>
    </section>
    
    <section data-markdown>
      <script type="text/template">
        ## Markdown Slide
        - Point 1
        - Point 2
      </script>
    </section>
  </div>
</div>
```

**Mermaid Diagram**:
```html
<div class="mermaid">
  graph TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Action 1]
    B -->|No| D[Action 2]
</div>
```

---

## SCSS Files

### custom.scss

**File Location**: `assets/scss/custom.scss`  
**Purpose**: Custom styles for website components  
**Dependencies**: None (compiles to CSS)

#### Components

##### `.slideshow-container`
```scss
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
```

**Properties**:
- `max-width: 1000px` - Limits container width
- `position: relative` - Establishes positioning context
- `margin: auto` - Centers container horizontally

**Usage**: Wrapper for slideshow content

##### `.mySlides`
```scss
.mySlides {
  display: none;
  width: 100%;
  height: auto;
}
```

**Properties**:
- `display: none` - Hidden by default
- `width: 100%` - Full container width
- `height: auto` - Maintains aspect ratio

**Usage**: Individual slide elements

##### `.dot`
```scss
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
```

**Properties**:
- `height/width: 15px` - Circular shape
- `margin: 0 2px` - Spacing between dots
- `background-color: #bbb` - Default gray color
- `border-radius: 50%` - Perfect circle
- `transition: background-color 0.6s ease` - Smooth color transitions

**Usage**: Navigation dots for slideshow

##### `.active`
```scss
.active {
  background-color: #717171;
}
```

**Properties**:
- `background-color: #717171` - Darker gray for active state

**Usage**: Applied to currently active navigation dot

#### Responsive Considerations

The styles are designed to be responsive:
- Container max-width prevents overflow on large screens
- `height: auto` maintains image aspect ratios
- Dots scale appropriately with container size

---

## Configuration Files

### _headers

**File Location**: `_headers`  
**Purpose**: HTTP headers for security and performance  
**Used by**: Netlify, Cloudflare, other CDNs

#### Security Headers

```http
/*
  X-Frame-Options: DENY
  X-XSS-Protection: 1; mode=block
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
```

**Headers Explained**:
- `X-Frame-Options: DENY` - Prevents clickjacking
- `X-XSS-Protection: 1; mode=block` - XSS protection
- `X-Content-Type-Options: nosniff` - Prevents MIME type sniffing
- `Referrer-Policy: strict-origin-when-cross-origin` - Controls referrer information

### _redirects

**File Location**: `_redirects`  
**Purpose**: URL redirects and rewrites  
**Used by**: Netlify, Cloudflare, other CDNs

#### Redirect Rules

```http
/old-page /new-page 301
/blog/* /news/:splat 301
```

**Format**: `from to status_code`

### manifest.webmanifest

**File Location**: `manifest.webmanifest`  
**Purpose**: Progressive Web App configuration  
**Used by**: Modern browsers for PWA features

#### Properties

```json
{
  "name": "Climate Processes and Predictability",
  "short_name": "ClimatePred",
  "description": "Research Group Website",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#3f51b5"
}
```

**Properties Explained**:
- `name` - Full application name
- `short_name` - Short name for app launcher
- `description` - App description
- `start_url` - Starting URL when launched
- `display` - Display mode (standalone removes browser UI)
- `background_color` - Background color during loading
- `theme_color` - Theme color for browser UI

---

## Best Practices

### JavaScript

1. **Error Handling**: Always include try-catch blocks for DOM operations
2. **Performance**: Use `requestAnimationFrame` for animations
3. **Accessibility**: Ensure keyboard navigation support
4. **Mobile**: Test touch interactions on mobile devices

### SCSS

1. **Organization**: Use BEM methodology for class naming
2. **Maintainability**: Keep selectors shallow and specific
3. **Performance**: Avoid deep nesting and complex selectors
4. **Responsive**: Use mobile-first approach

### General

1. **Documentation**: Comment complex logic and algorithms
2. **Testing**: Test across multiple browsers and devices
3. **Performance**: Optimize for Core Web Vitals
4. **Accessibility**: Follow WCAG 2.1 guidelines

---

## Troubleshooting

### Common Issues

1. **Slideshow not working**: Check for proper HTML structure and CSS classes
2. **Math not rendering**: Verify MathJax is loaded and configured correctly
3. **Styles not applying**: Check SCSS compilation and CSS loading order
4. **Performance issues**: Optimize images and minimize JavaScript

### Debug Tools

- Browser Developer Tools for JavaScript debugging
- CSS Inspector for style troubleshooting
- Network tab for resource loading issues
- Console for error messages

---

**Last Updated**: December 2024  
**Maintained by**: Climate Processes and Predictability Research Group 