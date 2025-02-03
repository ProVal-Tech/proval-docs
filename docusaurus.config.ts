import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: 'ProVal Tech Content Documentation',
  //tagline: 'Dinosaurs are cool',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://content.provaltech.com',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/proval-docs/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'proval-tech', // Usually your GitHub org/user name.
  projectName: 'proval-docs', // Usually your repo name.
  deploymentBranch: 'gh-pages',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          tags: 'tags.yml',
          onInlineTags: 'warn',
          editUrl:
            'https://github.com/proval-tech/proval-docs/tree/main/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],


  themeConfig: {
    // Replace with your project's social card
    image: 'img/proval-social-card.png',
    algolia: {
      // The application ID provided by Algolia
      appId: 'R5AN5V8GUY',

      // Public API key: it is safe to commit it
      apiKey: 'efd3f2eb9cbe9be8f7dab7a60b7e3aec',

      indexName: 'proval-techio',

      // Optional: see doc section below
      contextualSearch: true,

      // Optional: Specify domains where the navigation should occur through window.location instead on history.push. Useful when our Algolia config crawls multiple documentation sites and we want to navigate with window.location.href to them.
      // externalUrlRegex: 'external\\.com|domain\\.com',

      // Optional: Replace parts of the item URLs from Algolia. Useful when using the same search index for multiple deployments using a different baseUrl. You can use regexp or string in the `from` param. For example: localhost:3000 vs myCompany.com/docs
      // replaceSearchResultPathname: {
      //   from: '/docs/', // or as RegExp: /\/docs\//
      //   to: '/',
      // },

      // Optional: Algolia search parameters
      searchParameters: {},

      // Optional: path for search page that enabled by default (`false` to disable it)
      searchPagePath: 'search',

      // Optional: whether the insights feature is enabled or not on Docsearch (`false` by default)
      insights: true,

    },
    navbar: {
      //title: '',
      logo: {
        alt: 'ProVal Tech Logo',
        src: 'img/logo_r4.png',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'contentSidebar',
          position: 'left',
          label: 'Docs',
        },
        //{to: '/blog', label: 'Blog', position: 'left'},
        {
          href: 'https://github.com/ProVal-Tech/proval-docs',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        // {
        //   title: 'Docs',
        //   items: [
        //     {
        //       label: 'Tutorial',
        //       to: '/docs/intro',
        //     },
        //   ],
        // },
        {
          title: 'Community',
          items: [
            {
              label: 'X',
              href: 'https://x.com/provaltech',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/proval-tech',
            },
          ],
        },
      ],
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['powershell'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
