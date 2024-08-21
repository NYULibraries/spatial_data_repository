# @nulib/use-markdown

React hook for handling of Markdown in web applications with support for [GitHub flavored markdown](https://github.github.com/gfm/) content.

## Usage

Install the hook using your dependency manager.

```sh
npm i @nulib/use-markdown
```

Import the hook into your React application.

```jsx
import React from "react";
import useMarkdown from "@nulib/use-markdown";

const MyComponent = () => {
  const markdown = "# Heading 1";

  // returns both raw html and a jsx component with innerHtml content
  const { html, jsx } = useMarkdown(markdown);

  return <div>{jsx}</div>;
};

export default MyComponent;
```

Alternatively, you can do something with the `html` string directly.

```jsx
const { html } = useMarkdown(markdown);

// Do something with the html string
const newHtml = html + "<p>foo</p>";

return <div dangerouslySetInnerHTML={{ __html: newHtml }} />;
```

## Development

Run in development environment.

```sh
npm i
npm run dev
```

A browser session will begin:

```sh
  VITE v5.2.8  ready in 84 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```
