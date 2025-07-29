# Quick Reference Guide

A quick reference for common tasks and commands when working with the Climate Processes and Predictability Research Group website.

## 🚀 Quick Start

```bash
# Clone and setup
git clone https://github.com/climprocpred/climprocpred.github.io.git
cd climprocpred.github.io
hugo server -D
```

## 📁 File Locations

### Core Files
- **Main README**: `README.md`
- **Code Documentation**: `docs/CODE_DOCUMENTATION.md`
- **Development Guide**: `docs/DEVELOPMENT_GUIDE.md`
- **Custom JavaScript**: `assets/js/custom.js`
- **Custom SCSS**: `assets/scss/custom.scss`
- **MathJax Config**: `js/mathjax-config.js`
- **Slides Config**: `js/wowchemy-slides.js`

### Configuration Files
- **HTTP Headers**: `_headers`
- **Redirects**: `_redirects`
- **PWA Manifest**: `manifest.webmanifest`
- **Robots**: `robots.txt`
- **Sitemap**: `sitemap.xml`

### Content Directories
- **Publications**: `publication/`
- **Projects**: `projects/`
- **Team Members**: `author/`
- **Events**: `event/`
- **Blog Posts**: `post/`
- **Datasets**: `datasets/`
- **Opportunities**: `opportunities/`

## 🔧 Common Commands

### Hugo Commands
```bash
# Start development server
hugo server -D

# Build for production
hugo --minify

# Create new content
hugo new publication/my-paper.md
hugo new project/my-project.md
hugo new authors/my-name.md

# Check Hugo version
hugo version

# Clear cache
hugo --gc

# Verbose output
hugo server --verbose
```

### Git Commands
```bash
# Create feature branch
git checkout -b feature/your-feature

# Stage and commit
git add .
git commit -m "feat: your feature description"

# Push to remote
git push origin feature/your-feature

# Pull latest changes
git pull origin main
```

### Build Commands
```bash
# Build with drafts
hugo -D

# Build for specific environment
hugo --environment production

# Build with specific base URL
hugo --baseURL="https://climprocpred.github.io/"
```

## 🎨 Styling Quick Reference

### SCSS Variables
```scss
// Common colors
$primary-color: #3f51b5;
$secondary-color: #f5f5f5;
$text-color: #333;
$link-color: #007bff;

// Breakpoints
$mobile: 768px;
$tablet: 1024px;
$desktop: 1200px;
```

### Common Classes
```scss
// Slideshow
.slideshow-container
.mySlides
.dot
.active

// Responsive
@media (min-width: 768px) { }
@media (min-width: 1024px) { }
```

### BEM Methodology
```scss
.block { }
.block__element { }
.block__element--modifier { }
```

## 📝 Content Templates

### Publication Front Matter
```yaml
---
title: "Paper Title"
authors: ["Author Name"]
date: 2024-12-01
doi: "10.1000/xyz123"
publication_types: ["2"]
publication: "Journal Name"
publication_short: "J. Name"
abstract: "Brief description..."
featured: false
image:
  caption: "Image caption"
  focal_point: ""
  preview_only: false
---
```

### Project Front Matter
```yaml
---
title: "Project Title"
summary: "Brief description"
tags: ["climate", "prediction"]
date: 2024-12-01
external_link: ""
image:
  caption: "Project image"
  focal_point: Smart
---
```

### Author Front Matter
```yaml
---
title: "Your Name"
role: "Research Scientist"
bio: "Your background"
interests: ["Climate Modeling", "ML"]
education:
  courses:
  - course: PhD in Climate Science
    institution: University Name
    year: 2020
social:
- icon: envelope
  icon_pack: fas
  link: mailto:email@example.com
---
```

## 🔍 JavaScript Quick Reference

### DOM Manipulation
```javascript
// Select elements
const slides = document.querySelectorAll('.mySlides');
const dots = document.querySelectorAll('.dot');

// Add/remove classes
element.classList.add('active');
element.classList.remove('active');

// Change styles
element.style.display = 'block';
element.style.display = 'none';

// Event listeners
element.addEventListener('click', function() {
  // Handle click
});
```

### MathJax Usage
```markdown
# Inline math
The formula is $E = mc^2$

# Display math
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

# Alternative syntax
Inline: \(x^2 + y^2 = z^2\)
Display: \[F = ma\]
```

### Slideshow Functions
```javascript
// Global variable
var slideIndex = 0;

// Main function
function showSlides() {
  // Implementation
}

// Auto-start
showSlides();
```

## 🐛 Troubleshooting

### Common Issues

#### Hugo Server Won't Start
```bash
# Check version
hugo version

# Clear cache
hugo --gc

# Check for errors
hugo server --log
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
# Verify script loading
# Check for syntax errors
```

#### Build Failures
```bash
# Clean build
rm -rf public/
hugo --gc

# Check dependencies
hugo mod verify
```

### Debug Commands
```bash
# Verbose Hugo output
hugo server --verbose

# Debug template rendering
hugo server --log --verboseLog

# Check configuration
hugo config

# Validate HTML
html-validate public/

# Lint CSS
stylelint "css/**/*.css"

# Lint JavaScript
eslint "js/**/*.js"
```

## 📊 Performance Checklist

### Before Deployment
- [ ] Images optimized (WebP format)
- [ ] CSS minified
- [ ] JavaScript minified
- [ ] Critical CSS inlined
- [ ] Non-critical resources lazy loaded
- [ ] Alt text on all images
- [ ] Semantic HTML structure
- [ ] Accessibility tested

### Testing Checklist
- [ ] Cross-browser testing
- [ ] Mobile responsive
- [ ] JavaScript functionality
- [ ] Forms working
- [ ] Links working
- [ ] Images loading
- [ ] Math rendering correctly

## 🔗 Useful Links

### Documentation
- [Hugo Docs](https://gohugo.io/documentation/)
- [Wowchemy Docs](https://wowchemy.com/docs/)
- [GitHub Pages](https://pages.github.com/)

### Tools
- [Hugo Themes](https://themes.gohugo.io/)
- [Netlify](https://www.netlify.com/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)

### Validation
- [HTML Validator](https://validator.w3.org/)
- [CSS Validator](https://jigsaw.w3.org/css-validator/)
- [Accessibility Checker](https://wave.webaim.org/)

## 📞 Support

### Getting Help
1. Check this quick reference
2. Review the full documentation
3. Search existing issues
4. Create a new issue with details

### Issue Template
```markdown
**Description**: Brief description of the issue

**Steps to Reproduce**:
1. Step 1
2. Step 2
3. Step 3

**Expected Behavior**: What should happen

**Actual Behavior**: What actually happens

**Environment**:
- Hugo version: 
- Browser: 
- OS: 

**Additional Information**: Any other relevant details
```

---

**Last Updated**: December 2024  
**Maintained by**: Climate Processes and Predictability Research Group 