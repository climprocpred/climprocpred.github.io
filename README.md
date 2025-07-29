# Climate Processes and Predictability Research Group Website

This repository contains the source code for the Climate Processes and Predictability Research Group's academic website, built with Hugo and the Wowchemy theme.

## 📋 Table of Contents

- [Overview](#overview)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Development](#development)
- [Code Documentation](#code-documentation)
- [Deployment](#deployment)
- [Contributing](#contributing)

## 🌟 Overview

This website serves as the digital presence for the Climate Processes and Predictability Research Group, showcasing:
- Research projects and publications
- Team member profiles
- Academic events and opportunities
- Datasets and resources
- Contact information

The site is built using Hugo, a fast static site generator, with the Wowchemy academic theme providing a modern, responsive design optimized for academic content.

## 🛠 Technology Stack

- **Static Site Generator**: [Hugo](https://gohugo.io/) v0.100+
- **Theme**: [Wowchemy](https://wowchemy.com/) v5.6.0
- **CSS Preprocessor**: SCSS
- **JavaScript**: Vanilla JS with MathJax integration
- **Deployment**: GitHub Pages
- **Content Management**: Netlify CMS (optional)

## 📁 Project Structure

```
climprocpred.github.io/
├── assets/                 # Source assets (SCSS, JS)
│   ├── js/
│   │   └── custom.js      # Custom JavaScript functionality
│   └── scss/
│       └── custom.scss    # Custom styles
├── css/                   # Compiled CSS files
├── js/                    # JavaScript libraries and configurations
│   ├── mathjax-config.js  # MathJax configuration
│   └── wowchemy-slides.js # Presentation functionality
├── content/               # Hugo content files (not shown in build)
├── static/                # Static assets (images, files)
├── layouts/               # Custom Hugo templates (not shown in build)
├── config/                # Hugo configuration (not shown in build)
└── public/                # Generated static site (this directory)
```

## 🚀 Getting Started

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) v0.100 or later
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (for asset compilation)

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/climprocpred/climprocpred.github.io.git
   cd climprocpred.github.io
   ```

2. **Install dependencies** (if using npm/yarn for asset management)
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Start development server**
   ```bash
   hugo server -D
   ```

4. **View the site**
   Open [http://localhost:1313](http://localhost:1313) in your browser.

## 💻 Development

### Adding New Content

- **Publications**: Add to `content/publication/`
- **Projects**: Add to `content/project/`
- **Team Members**: Add to `content/authors/`
- **Events**: Add to `content/event/`
- **Blog Posts**: Add to `content/post/`

### Customizing Styles

Edit `assets/scss/custom.scss` for custom CSS. The file includes:
- Slideshow container styles
- Navigation dot styling
- Custom component overrides

### Adding JavaScript Functionality

Edit `assets/js/custom.js` for custom JavaScript. Current features include:
- Automatic slideshow functionality
- Image carousel with navigation dots

## 📚 Code Documentation

### JavaScript Files

#### `assets/js/custom.js`
Custom JavaScript functionality for the website.

**Functions:**
- `showSlides()`: Manages automatic slideshow with 2-second intervals
- `slideIndex`: Global variable tracking current slide position

**Usage:**
```html
<!-- HTML structure required -->
<div class="slideshow-container">
  <div class="mySlides">...</div>
  <div class="mySlides">...</div>
  <!-- Navigation dots -->
  <span class="dot"></span>
  <span class="dot"></span>
</div>
```

#### `js/mathjax-config.js`
Configuration for MathJax mathematical rendering.

**Features:**
- Inline math support: `$...$` and `\(...\)`
- Display math support: `$$...$$` and `\[...\]`
- Error handling with `noerrors` package
- Markmap compatibility

#### `js/wowchemy-slides.js`
Presentation functionality using Reveal.js.

**Features:**
- Markdown support in slides
- Search functionality
- Speaker notes
- Mathematical rendering with KaTeX
- Zoom capabilities
- Mermaid diagram support
- Menu system

### SCSS Files

#### `assets/scss/custom.scss`
Custom stylesheet for website components.

**Components:**
- `.slideshow-container`: Main slideshow wrapper
- `.mySlides`: Individual slide styling
- `.dot`: Navigation dot styling
- `.active`: Active dot state

## 🚀 Deployment

### GitHub Pages

This site is configured for GitHub Pages deployment:

1. **Automatic Deployment**: Push to `main` branch triggers automatic build
2. **Manual Deployment**: Use GitHub Actions or Netlify
3. **Custom Domain**: Configured via `_headers` and `_redirects`

### Build Process

```bash
# Build for production
hugo --minify

# Build with draft content
hugo -D

# Build for specific environment
hugo --environment production
```

## 🤝 Contributing

### Development Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow the existing code style
   - Test locally before committing
   - Update documentation as needed

3. **Submit a pull request**
   - Provide clear description of changes
   - Include screenshots for UI changes
   - Reference any related issues

### Code Style Guidelines

- **JavaScript**: Use ES6+ features, meaningful variable names
- **SCSS**: Follow BEM methodology, use meaningful class names
- **HTML**: Semantic markup, accessibility considerations
- **Content**: Markdown format, clear structure

### Testing

- Test on multiple browsers (Chrome, Firefox, Safari, Edge)
- Verify responsive design on mobile devices
- Check accessibility with screen readers
- Validate HTML and CSS

## 📞 Support

For questions or issues:
- Create an issue on GitHub
- Contact the development team
- Check Hugo and Wowchemy documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Last Updated**: December 2024  
**Maintained by**: Climate Processes and Predictability Research Group
