---
name: revealjs-slideshow
description: Create and maintain reveal.js HTML presentations with support for Markdown, code highlighting, animations, transitions, themes, speaker notes, math formulas, and plugins. Use when user requests creating slideshows, presentations, or reveal.js content.
---

# Reveal.js Slideshow Expert

Create and maintain beautiful HTML presentations using the reveal.js framework with full support for all available features.

## Knowledge Base

**Source**: Context7 - /reveal/revealjs.com
**Documentation Retrieved**: 2025-11-16
**Reveal.js Version**: 5.x (latest stable)
**Code Snippets Analyzed**: 212

## Instructions

You are a reveal.js expert. When invoked, create or maintain HTML presentations using reveal.js with comprehensive feature support.

### Steps to Create a New Presentation:

1. **Gather presentation requirements**:
   - Ask about topic, structure, and target audience
   - Determine content format (HTML, Markdown, or hybrid)
   - Identify if code highlighting is needed
   - Check if speaker notes are required
   - Determine theme preference and transition style

2. **Create basic HTML structure** with proper DOCTYPE, CSS, and script includes

3. **Add required plugins** based on needs (Markdown, Highlight, Notes, Math)

4. **Configure presentation options** (transitions, navigation, dimensions, etc.)

5. **Create slide content** using appropriate features

6. **Test presentation** functionality and appearance

### Core Features Reference:

#### Basic Slide Structure

**Minimal HTML template**:
```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>My Presentation</title>
    <link rel="stylesheet" href="dist/reveal.css">
    <link rel="stylesheet" href="dist/theme/black.css">
  </head>
  <body>
    <div class="reveal">
      <div class="slides">
        <section>Slide 1</section>
        <section>Slide 2</section>
      </div>
    </div>
    <script src="dist/reveal.js"></script>
    <script>
      Reveal.initialize();
    </script>
  </body>
</html>
```

**Vertical slides** (nesting for sub-topics):
```html
<section>
  <section>Main Topic</section>
  <section>Sub-topic 1</section>
  <section>Sub-topic 2</section>
</section>
```

#### Markdown Support

**Enable Markdown plugin**:
```html
<script src="plugin/markdown/markdown.js"></script>
<script>
  Reveal.initialize({
    plugins: [RevealMarkdown],
    markdown: { smartypants: true }
  });
</script>
```

**Inline Markdown slides**:
```html
<section data-markdown>
  <textarea data-template>
    ## Slide Title
    Content with **bold** and *italic*
    ---
    ## Next Slide
  </textarea>
</section>
```

**External Markdown file**:
```html
<section
  data-markdown="slides.md"
  data-separator="^\n\n\n"
  data-separator-vertical="^\n\n"
  data-separator-notes="^Note:"
>
</section>
```

#### Code Highlighting

**Enable Highlight plugin**:
```html
<link rel="stylesheet" href="plugin/highlight/monokai.css">
<script src="plugin/highlight/highlight.js"></script>
<script>
  Reveal.initialize({
    plugins: [RevealHighlight]
  });
</script>
```

**Code block with line numbers**:
```html
<pre><code data-trim data-line-numbers class="language-python">
def hello():
    print("Hello, World!")
</code></pre>
```

**Step-by-step line highlighting**:
```html
<pre><code data-line-numbers="1-2|3|4">
let a = 1;
let b = 2;
let c = x => 1 + 2 + x;
c(3);
</code></pre>
```

**Markdown code with highlighting**:
```markdown
```js [1-2|3|4]
let a = 1;
let b = 2;
let c = x => 1 + 2 + x;
c(3);
```
```

#### Themes and Transitions

**Available themes**: black (default), white, league, beige, sky, night, serif, simple, solarized, blood, moon

**Apply theme**:
```html
<link rel="stylesheet" href="dist/theme/white.css">
```

**Configure transitions**:
```javascript
Reveal.initialize({
  transition: 'slide', // none/fade/slide/convex/concave/zoom
  transitionSpeed: 'default', // default/fast/slow
  backgroundTransition: 'fade'
});
```

**Per-slide transition**:
```html
<section data-transition="zoom" data-transition-speed="fast">
  <h2>Custom transition</h2>
</section>
```

#### Fragments (Progressive Reveal)

**Fragment types**: fade-in, fade-out, fade-up, highlight-red, highlight-green, highlight-blue, fade-in-then-out

```html
<p class="fragment">Appears first</p>
<p class="fragment fade-up">Slides up</p>
<p class="fragment highlight-red">Highlights red</p>
```

**Nested fragments** (sequential):
```html
<span class="fragment fade-in">
  <span class="fragment highlight-red">
    <span class="fragment fade-out">
      Fade in > Red > Fade out
    </span>
  </span>
</span>
```

#### Auto-Animate

**Basic auto-animate**:
```html
<section data-auto-animate>
  <h1>Title</h1>
</section>
<section data-auto-animate>
  <h1 style="margin-top: 100px; color: blue;">Title</h1>
</section>
```

**Code animation** (use `data-id` on `<pre>` and `data-line-numbers` on `<code>`):
```html
<section data-auto-animate>
  <pre data-id="code"><code data-trim data-line-numbers>
    let x = 1;
  </code></pre>
</section>
<section data-auto-animate>
  <pre data-id="code"><code data-trim data-line-numbers>
    let x = 1;
    let y = 2;
  </code></pre>
</section>
```

**Animation settings**:
```javascript
Reveal.initialize({
  autoAnimateEasing: 'ease-out',
  autoAnimateDuration: 0.8,
  autoAnimateUnmatched: false
});
```

#### Speaker Notes and Speaker View

**Enable Notes plugin**:
```html
<script src="plugin/notes/notes.js"></script>
<script>
  Reveal.initialize({
    plugins: [RevealNotes]
  });
</script>
```

**Add speaker notes**:
```html
<section>
  <h2>Slide Title</h2>
  <aside class="notes">
    Private speaker notes here
  </aside>
</section>
```

**Markdown notes**:
```html
<section data-markdown>
  <textarea data-template>
    ## Content

    Note:
    Speaker notes in Markdown
  </textarea>
</section>
```

**Configure timing**:
```javascript
Reveal.initialize({
  defaultTiming: 120, // seconds per slide
  // or
  totalTime: 3600 // total presentation time
});
```

**Access speaker view**: Press 'S' during presentation

#### Backgrounds

**Color background**:
```html
<section data-background-color="#ff0000">
```

**Image background**:
```html
<section data-background="image.png">
```

**Video background**:
```html
<section data-background-video="video.mp4,video.webm">
```

**Tiled pattern**:
```html
<section
  data-background="pattern.png"
  data-background-repeat="repeat"
  data-background-size="100px"
>
```

#### Math Formulas

**KaTeX plugin** (recommended):
```html
<script src="plugin/math/math.js"></script>
<script>
  Reveal.initialize({
    katex: { version: 'latest' },
    plugins: [RevealMath.KaTeX]
  });
</script>
```

**Using formulas**:
```html
<p>Inline: $E = mc^2$</p>
<p>Display: $$\int_0^1 x^2 dx$$</p>
```

#### Configuration Options

**Comprehensive configuration**:
```javascript
Reveal.initialize({
  // Display controls
  controls: true,
  progress: true,
  slideNumber: false, // true | 'h.v' | 'h/v' | 'c' | 'c/t'
  hash: false,
  history: false,
  keyboard: true,
  overview: true,
  center: true,
  touch: true,
  loop: false,
  rtl: false,
  navigationMode: 'default', // 'default' | 'linear' | 'grid'
  shuffle: false,
  fragments: true,
  embedded: false,

  // Presentation size
  width: 960,
  height: 700,
  margin: 0.04,
  minScale: 0.2,
  maxScale: 2.0,

  // Plugins
  plugins: []
});
```

#### API Methods

**Navigation**:
```javascript
Reveal.slide(h, v, f);  // Navigate to slide
Reveal.next();           // Next slide
Reveal.prev();           // Previous slide
Reveal.left();           // Previous horizontal
Reveal.right();          // Next horizontal
```

**State**:
```javascript
let state = Reveal.getState();     // Save state
Reveal.setState(state);            // Restore state
Reveal.getIndices();               // {h, v, f}
Reveal.getProgress();              // 0-1
```

**Layout**:
```javascript
Reveal.sync();          // Update all elements
Reveal.layout();        // Update scale
Reveal.shuffle();       // Randomize slides
```

### Installation Methods:

**From npm**:
```bash
npm install reveal.js
npm start  # Development server at http://localhost:8000
```

**From CDN**:
```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.css">
<script src="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.js"></script>
```

### PDF Export:

1. Add `?print-pdf` to presentation URL
2. Open print dialog (Ctrl/Cmd + P)
3. Set destination to "Save as PDF"
4. Enable background graphics
5. Save

### Guidelines:

**Content structure**:
- Use vertical slides for related sub-topics
- Use horizontal slides for main sections
- Keep slides focused and concise
- Use fragments to reveal information progressively

**Code presentation**:
- Always use `data-trim` to remove indentation
- Use `data-noescape` when needed
- Apply line highlighting to focus attention
- Use step-by-step highlighting for explanations
- Choose syntax themes that match presentation theme

**Performance**:
- Set `viewDistance` appropriately (default: 3)
- Optimize images and videos
- Use lazy loading for iframes with `preloadIframes: null`

**Accessibility**:
- Provide speaker notes for context
- Use semantic HTML elements
- Ensure sufficient color contrast
- Test keyboard navigation

**Speaker view best practices**:
- Always add speaker notes for presentations
- Set timing information for pacing
- Test speaker view before presenting (press 'S')

**Responsive design**:
- Set appropriate width/height ratio (default: 960x700)
- Test on different screen sizes
- Use percentage-based sizing where appropriate

### Common Workflows:

**Create presentation from scratch**:
1. Start with basic HTML template
2. Choose theme and configure transitions
3. Add required plugins (Markdown, Highlight, Notes)
4. Create slide structure (horizontal/vertical)
5. Add content with appropriate features
6. Test all functionality
7. Export to PDF if needed

**Convert existing slides**:
1. Extract content outline
2. Map to horizontal/vertical structure
3. Add fragments for progressive reveal
4. Include speaker notes
5. Apply transitions and animations
6. Test and refine

**Maintain existing presentation**:
1. Read current structure and understand organization
2. Identify plugins and features in use
3. Make changes while maintaining consistency
4. Test all features still work
5. Update speaker notes if needed

### Best Practices:

- Include DOCTYPE and proper HTML structure
- Load CSS before JavaScript
- Initialize reveal.js after DOM ready
- Use semantic HTML elements
- Test in target browsers
- Keep slide content focused
- Use animations sparingly
- Ensure readable font sizes
- Provide good color contrast
- Always test speaker view before presenting

### Example: Complete Presentation

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Presentation</title>
    <link rel="stylesheet" href="dist/reveal.css">
    <link rel="stylesheet" href="dist/theme/black.css">
    <link rel="stylesheet" href="plugin/highlight/monokai.css">
  </head>
  <body>
    <div class="reveal">
      <div class="slides">
        <section>
          <h1>Presentation Title</h1>
          <p>Subtitle or author</p>
        </section>

        <section data-markdown>
          <textarea data-template>
            ## Agenda
            - Introduction
            - Main Content
            - Conclusion
          </textarea>
        </section>

        <section>
          <section><h2>Main Topic</h2></section>
          <section>
            <h2>Details</h2>
            <p class="fragment">Point 1</p>
            <p class="fragment">Point 2</p>
          </section>
        </section>

        <section>
          <h2>Code Example</h2>
          <pre><code data-trim data-line-numbers="1-2|3-4">
            function hello() {
              console.log("Hello");
              console.log("World");
            }
          </code></pre>
          <aside class="notes">
            Explain code step by step
          </aside>
        </section>
      </div>
    </div>

    <script src="dist/reveal.js"></script>
    <script src="plugin/markdown/markdown.js"></script>
    <script src="plugin/highlight/highlight.js"></script>
    <script src="plugin/notes/notes.js"></script>
    <script>
      Reveal.initialize({
        hash: true,
        transition: 'slide',
        plugins: [RevealMarkdown, RevealHighlight, RevealNotes]
      });
    </script>
  </body>
</html>
```

## Version History

- v1.0.0 (2025-11-16): Initial reveal.js slideshow skill
  - Based on Context7 documentation (/reveal/revealjs.com)
  - Comprehensive reveal.js 5.x feature coverage
  - 212 code snippets analyzed
  - Includes: Markdown, code highlighting, animations, transitions, themes, plugins
  - Full configuration options and API reference
  - Best practices and common workflows
