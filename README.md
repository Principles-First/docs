# Moss Documentation

Official documentation for the Moss AI assistant. Built with [Mintlify](https://mintlify.com).

## Overview

This documentation provides comprehensive configuration guidance for integrating and customizing Moss, an AI-powered assistant that helps users navigate and interact with your application.

## Structure

### Directory Structure

The documentation uses language-specific directories for internationalization:

```
docs/
├── en/                     # English content
│   ├── index.mdx          # Homepage
│   └── configurations/
│       └── settings-reference.mdx
├── ko/                     # Korean content
│   ├── index.mdx          # 홈페이지
│   └── configurations/
│       └── settings-reference.mdx
└── docs.json              # Configuration
```

### Internationalization (i18n)

This documentation supports multiple languages:

-   **English (en)** - Default language (files in `en/` directory)
-   **Korean (ko)** - Korean translation (files in `ko/` directory)

Each language has its own directory with a complete set of translated documentation files.

## Local Development

Install dependencies:

```bash
npm install
```

Run the development server:

```bash
npm run dev
```

The documentation will be available at `http://localhost:3000`.

## Configuration

The documentation is configured through `docs.json`:

-   **i18n**: English (default) and Korean language support
-   **Navigation**: Simple structure with Getting Started and Configuration sections
-   **Branding**: Moss logo and black/white color scheme
-   **Theme**: Mintlify mint theme

## Logo

The Moss logo is located in `/logo/`:

-   `light.svg` - Logo for light theme
-   `dark.svg` - Logo for dark theme

Both use the same SVG with a black background and white foreground design.

## About Moss

Moss is an AI-powered assistant that provides contextual guidance to users within your application. Key features include:

-   Vision-based screen understanding
-   Session replay and analytics
-   Multi-step planning capabilities
-   Customizable behavior through dashboard and SDK
-   Screen history tracking for improved context

For more information about Moss, visit [viamoss.ai](https://viamoss.ai).
