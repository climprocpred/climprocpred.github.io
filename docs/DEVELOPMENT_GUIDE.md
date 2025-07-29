# Development Guide

This guide provides comprehensive instructions for developers contributing to the Climate Processes and Predictability Research Group website.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Local Development Setup](#local-development-setup)
- [Development Workflow](#development-workflow)
- [Code Standards](#code-standards)
- [Testing](#testing)
- [Performance Optimization](#performance-optimization)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required Software

1. **Hugo Extended** (v0.100 or later)
   ```bash
   # macOS with Homebrew
   brew install hugo
   
   # Windows with Chocolatey
   choco install hugo-extended
   
   # Linux
   sudo apt-get install hugo
   ```

2. **Git** (v2.30 or later)
   ```bash
   # Verify installation
   git --version
   ```

3. **Node.js** (v16 or later) - for asset compilation
   ```bash
   # Verify installation
   node --version
   npm --version
   ```

### Optional Tools

- **Visual Studio Code** with extensions:
  - Hugo Language and Syntax Support
  - Markdown All in One
  - Prettier - Code formatter
  - Live Server

- **Browser Developer Tools** for debugging

---

## Local Development Setup

### 1. Clone the Repository

```bash
git clone https://github.com/climprocpred/climprocpred.github.io.git
cd climprocpred.github.io
```

### 2. Install Dependencies

```bash
# Install Hugo modules (if using)
hugo mod get

# Install npm packages (if using)
npm install
```

### 3. Start Development Server

```bash
# Basic development server
hugo server

# With draft content
hugo server -D

# With live reload
hugo server --liveReloadPort=443 --bind=0.0.0.0

# With specific port
hugo server --port=8080
```

### 4. Access the Site

Open your browser and navigate to:
- **Local**: http://localhost:1313
- **Network**: http://your-ip:1313 (if using --bind)

---

## Development Workflow

### 1. Creating a New Feature

```bash
# Create and switch to feature branch
git checkout -b feature/your-feature-name

# Make your changes
# ... edit files ...

# Stage changes
git add .

# Commit with descriptive message
git commit -m "feat: add slideshow functionality

- Implement automatic slideshow with 2-second intervals
- Add navigation dots for manual control
- Include responsive design considerations"

# Push to remote
git push origin feature/your-feature-name
```

### 2. Adding New Content

#### Publications
```bash
# Create new publication
hugo new publication/my-new-paper.md
```

**Publication Front Matter**:
```yaml
---
title: "Your Paper Title"
authors: ["Your Name", "Co-author Name"]
date: 2024-12-01
doi: "10.1000/xyz123"
publication_types: ["2"]
publication: "Journal Name"
publication_short: "J. Name"
abstract: "Brief description of the paper..."
featured: false
image:
  caption: "Image caption"
  focal_point: ""
  preview_only: false
---
```

#### Projects
```bash
# Create new project
hugo new project/my-new-project.md
```

**Project Front Matter**:
```yaml
---
title: "Project Title"
summary: "Brief project description"
tags: ["climate", "prediction"]
date: 2024-12-01
external_link: ""
image:
  caption: "Project image"
  focal_point: Smart
---
```

#### Team Members
```bash
# Create new author profile
hugo new authors/your-name.md
```

**Author Front Matter**:
```yaml
---
title: "Your Name"
role: "Research Scientist"
bio: "Your research interests and background"
interests: ["Climate Modeling", "Machine Learning"]
education:
  courses:
  - course: PhD in Climate Science
    institution: University Name
    year: 2020
social:
- icon: envelope
  icon_pack: fas
  link: mailto:your.email@example.com
- icon: twitter
  icon_pack: fab
  link: https://twitter.com/yourusername
---
```

### 3. Customizing Styles

#### Adding Custom CSS

1. **Edit SCSS file**:
   ```scss
   // assets/scss/custom.scss
   
   // Custom component styles
   .my-custom-component {
     background-color: #f5f5f5;
     padding: 1rem;
     border-radius: 4px;
     
     &:hover {
       background-color: #e0e0e0;
     }
   }
   ```

2. **Compile and test**:
   ```bash
   # Hugo automatically compiles SCSS
   hugo server
   ```

#### Responsive Design

```scss
// Mobile-first approach
.my-component {
  // Base styles (mobile)
  padding: 1rem;
  
  // Tablet and up
  @media (min-width: 768px) {
    padding: 2rem;
  }
  
  // Desktop and up
  @media (min-width: 1024px) {
    padding: 3rem;
  }
}
```

### 4. Adding JavaScript Functionality

#### Custom JavaScript

1. **Edit JavaScript file**:
   ```javascript
   // assets/js/custom.js
   
   // Add new functionality
   function myCustomFunction() {
     console.log('Custom function executed');
   }
   
   // Event listeners
   document.addEventListener('DOMContentLoaded', function() {
     // Your code here
   });
   ```

2. **Include in templates** (if needed):
   ```html
   {{ $custom_js := resources.Get "js/custom.js" | resources.Minify }}
   <script src="{{ $custom_js.RelPermalink }}"></script>
   ```

#### MathJax Integration

```javascript
// js/mathjax-config.js
window.MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']],
    displayMath: [['$$', '$$'], ['\\[', '\\]']],
    processEscapes: false,
    packages: {'[+]': ['noerrors']}
  },
  loader: {
    load: ['[tex]/noerrors']
  }
};
```

---

## Code Standards

### JavaScript Standards

#### Naming Conventions
```javascript
// Variables and functions: camelCase
const myVariable = 'value';
function myFunction() { }

// Constants: UPPER_SNAKE_CASE
const API_BASE_URL = 'https://api.example.com';

// Classes: PascalCase
class MyClass { }

// Files: kebab-case
// my-component.js
```

#### Code Style
```javascript
// Use const/let instead of var
const slides = document.querySelectorAll('.slide');
let currentIndex = 0;

// Use arrow functions for callbacks
slides.forEach((slide, index) => {
  slide.addEventListener('click', () => {
    handleSlideClick(index);
  });
});

// Use template literals
const message = `Current slide: ${currentIndex + 1} of ${slides.length}`;

// Use destructuring
const { title, author, date } = publication;
```

#### Error Handling
```javascript
function safeDOMOperation() {
  try {
    const element = document.querySelector('.my-element');
    if (!element) {
      throw new Error('Element not found');
    }
    element.classList.add('active');
  } catch (error) {
    console.error('DOM operation failed:', error);
    // Fallback behavior
  }
}
```

### SCSS Standards

#### BEM Methodology
```scss
// Block
.slideshow {
  // Element
  &__slide {
    // Modifier
    &--active {
      display: block;
    }
  }
  
  &__dot {
    &--active {
      background-color: #717171;
    }
  }
}
```

#### Organization
```scss
// 1. Variables
$primary-color: #3f51b5;
$secondary-color: #f5f5f5;

// 2. Mixins
@mixin responsive($breakpoint) {
  @media (min-width: $breakpoint) {
    @content;
  }
}

// 3. Base styles
.slideshow {
  // Component styles
}

// 4. Utilities
.sr-only {
  // Screen reader only
}
```

### HTML Standards

#### Semantic Markup
```html
<!-- Use semantic elements -->
<header>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
  </nav>
</header>

<main>
  <article>
    <h1>Article Title</h1>
    <section>
      <h2>Section Title</h2>
      <p>Content...</p>
    </section>
  </article>
</main>

<footer>
  <p>&copy; 2024 Research Group</p>
</footer>
```

#### Accessibility
```html
<!-- Include alt text for images -->
<img src="image.jpg" alt="Descriptive text" />

<!-- Use ARIA labels -->
<button aria-label="Close modal">×</button>

<!-- Semantic form labels -->
<label for="email">Email:</label>
<input type="email" id="email" name="email" />
```

---

## Testing

### Manual Testing Checklist

#### Cross-Browser Testing
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)

#### Responsive Testing
- [ ] Mobile (320px - 768px)
- [ ] Tablet (768px - 1024px)
- [ ] Desktop (1024px+)

#### Functionality Testing
- [ ] Navigation works correctly
- [ ] Forms submit properly
- [ ] Links open correctly
- [ ] Images load properly
- [ ] JavaScript functionality works

#### Accessibility Testing
- [ ] Keyboard navigation
- [ ] Screen reader compatibility
- [ ] Color contrast ratios
- [ ] Focus indicators

### Automated Testing

#### HTML Validation
```bash
# Install html-validate
npm install -g html-validate

# Validate HTML
html-validate public/
```

#### CSS Validation
```bash
# Install stylelint
npm install -g stylelint

# Validate CSS
stylelint "css/**/*.css"
```

#### JavaScript Linting
```bash
# Install ESLint
npm install -g eslint

# Lint JavaScript
eslint "js/**/*.js" "assets/js/**/*.js"
```

---

## Performance Optimization

### Image Optimization

#### WebP Conversion
```bash
# Convert images to WebP
cwebp -q 80 image.jpg -o image.webp
```

#### Responsive Images
```html
<picture>
  <source srcset="image.webp" type="image/webp">
  <source srcset="image.jpg" type="image/jpeg">
  <img src="image.jpg" alt="Description">
</picture>
```

### CSS Optimization

#### Critical CSS
```html
<!-- Inline critical CSS -->
<style>
  /* Critical styles here */
</style>

<!-- Load non-critical CSS asynchronously -->
<link rel="preload" href="non-critical.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
```

#### CSS Minification
```bash
# Hugo automatically minifies CSS in production
hugo --minify
```

### JavaScript Optimization

#### Code Splitting
```javascript
// Load JavaScript asynchronously
const script = document.createElement('script');
script.src = 'non-critical.js';
script.async = true;
document.head.appendChild(script);
```

#### Lazy Loading
```javascript
// Lazy load images
const images = document.querySelectorAll('img[data-src]');
const imageObserver = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      img.classList.remove('lazy');
      observer.unobserve(img);
    }
  });
});

images.forEach(img => imageObserver.observe(img));
```

---

## Deployment

### GitHub Pages

#### Automatic Deployment
1. Push to `main` branch
2. GitHub Actions builds and deploys
3. Site available at `https://climprocpred.github.io`

#### Manual Deployment
```bash
# Build for production
hugo --minify

# Commit and push
git add .
git commit -m "Build for production"
git push origin main
```

### Netlify

#### Netlify Configuration
```toml
# netlify.toml
[build]
  publish = "public"
  command = "hugo --minify"

[build.environment]
  HUGO_VERSION = "0.100.0"
  HUGO_ENV = "production"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

### Environment Variables

#### Development
```bash
# .env.development
HUGO_ENV=development
HUGO_BASEURL=http://localhost:1313/
```

#### Production
```bash
# .env.production
HUGO_ENV=production
HUGO_BASEURL=https://climprocpred.github.io/
```

---

## Troubleshooting

### Common Issues

#### Hugo Server Not Starting
```bash
# Check Hugo version
hugo version

# Clear cache
hugo --gc

# Check for syntax errors
hugo --log
```

#### Styles Not Loading
```bash
# Check SCSS compilation
hugo server --verbose

# Verify file paths
ls assets/scss/
```

#### JavaScript Errors
```bash
# Check browser console
# Verify script loading order
# Check for syntax errors
```

#### Build Failures
```bash
# Check Hugo version compatibility
hugo version

# Verify all dependencies
hugo mod verify

# Clean build
rm -rf public/
hugo --gc
```

### Debug Tools

#### Browser Developer Tools
- **Console**: JavaScript errors and logging
- **Network**: Resource loading issues
- **Elements**: DOM inspection
- **Performance**: Performance profiling

#### Hugo Debugging
```bash
# Verbose output
hugo server --verbose

# Debug template rendering
hugo server --log --verboseLog

# Check configuration
hugo config
```

#### Performance Monitoring
```bash
# Lighthouse audit
npx lighthouse https://climprocpred.github.io

# PageSpeed Insights
# https://pagespeed.web.dev/
```

---

## Resources

### Documentation
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Wowchemy Documentation](https://wowchemy.com/docs/)
- [GitHub Pages](https://pages.github.com/)

### Tools
- [Hugo Themes](https://themes.gohugo.io/)
- [Hugo Modules](https://gohugo.io/hugo-modules/)
- [Netlify](https://www.netlify.com/)

### Best Practices
- [Web Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Performance Best Practices](https://web.dev/performance/)
- [SEO Best Practices](https://developers.google.com/search/docs)

---

**Last Updated**: December 2024  
**Maintained by**: Climate Processes and Predictability Research Group 