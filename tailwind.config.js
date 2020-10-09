const defaultTheme = require('tailwindcss/defaultTheme')
const selectorParser = require("postcss-selector-parser");

module.exports = {
  dark: 'media',
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
    darkModeVariant: true
  },
  purge: [
  ],
  theme: {
    darkSelector: ".mode-dark",
    backgroundImage: {
      'gradient-to-t': 'linear-gradient(to top, var(--gradient-color-stops))',
      'gradient-to-tr': 'linear-gradient(to top right, var(--gradient-color-stops))',
      'gradient-to-r': 'linear-gradient(to right, var(--gradient-color-stops))',
      'gradient-to-br': 'linear-gradient(to bottom right, var(--gradient-color-stops))',
      'gradient-to-b': 'linear-gradient(to bottom, var(--gradient-color-stops))',
      'gradient-to-bl': 'linear-gradient(to bottom left, var(--gradient-color-stops))',
      'gradient-to-l': 'linear-gradient(to left, var(--gradient-color-stops))',
      'gradient-to-tl': 'linear-gradient(to top left, var(--gradient-color-stops))',
    },
    gradientColorStops: (theme) => theme('colors'),
    extend: {
      spacing: {
        '9/16': '56.25%',
      },
      lineHeight: {
        '11': '2.75rem',
        '12': '3rem',
        '13': '3.25rem',
        '14': '3.5rem',
      },
      fontFamily: {
        'sans': ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        code: {
          green: '#b5f4a5',
          yellow: '#ffe484',
          purple: '#d9a9ff',
          red: '#ff8383',
          blue: '#93ddfd',
          white: '#fff',
        },
      },
      typography: (theme) => ({
        default: {
          css: {
            color: theme('colors.gray.700'),
            h2: {
              fontWeight: '700',
              letterSpacing: theme('letterSpacing.tight'),
              color: theme('colors.gray.900'),
            },
            h3: {
              fontWeight: '600',
              color: theme('colors.gray.900'),
            },
            'ol li:before': {
              fontWeight: '600',
              color: theme('colors.gray.500'),
            },
            'ul li:before': {
              backgroundColor: theme('colors.gray.400'),
            },
            a: {
              color: theme('colors.gray.900'),
            },
            blockquote: {
              color: theme('colors.gray.900'),
              borderLeftColor: theme('colors.gray.200'),
            },
          },
        },
        dark: {
          css: {
            color: theme("colors.gray.300"),
            '[class~="lead"]': {
              color: theme("colors.gray.400")
            },
            blockquote: {
              color: theme("colors.gray.300"),
              borderLeftColor: theme("colors.gray.700")
            },
            hr: {
              borderTopColor: theme("colors.gray.800")
            },
            strong: {
              color: theme("colors.white")
            },
            "figure figcaption": {
              color: theme("colors.gray.500")
            },
            a: {
              color: theme("colors.white")
            },
            th: {
              color: theme("colors.white")
            },
            "h1, h2, h3, h4": {
              color: theme("colors.white")
            },
            code: {
              color: theme("colors.gray.300")
            },
            "code:before": {
              color: theme("colors.gray.300")
            },
            "code:after": {
              color: theme("colors.gray.300")
            },
            "ol > li:before": {
              color: theme("colors.gray.400")
            },
            "ul > li:before": {
              backgroundColor: theme("colors.gray.600")
            }
          }
        }
      }),
    },
  },
  variants: {
    typography: ["dark:typography"],
    backgroundImage: ['responsive'],
    gradientColorStops: ['responsive', 'hover', 'focus'],
  },
  plugins: [
    require('@tailwindcss/ui'),
    require('@tailwindcss/typography'),
    function ({ addBase, addComponents, theme, addVariant, prefix }) {
      addVariant("dark:typography", ({ modifySelectors, separator }) => {
        modifySelectors(({ selector }) => {
          return selectorParser((selectors) => {
            selectors.walkClasses((sel) => {
              sel.value = `dark:typography${separator}${sel.value}`;
              sel.parent.insertBefore(sel, selectorParser().astSync(prefix(".mode-dark ")));
            });
          }).processSync(selector);
        });
      });
      addBase([
        {
          '@font-face': {
            fontFamily: 'Inter var',
            fontWeight: '100 900',
            fontStyle: 'normal',
            fontNamedInstance: 'Regular',
            fontDisplay: 'swap',
            src: 'url("./MyTheme/fonts/Inter-roman.var-latin.woff2") format("woff2")',
          },
        },
        {
          '@font-face': {
            fontFamily: 'Inter var',
            fontWeight: '100 900',
            fontStyle: 'italic',
            fontNamedInstance: 'Italic',
            fontDisplay: 'swap',
            src: 'url("./MyTheme/fonts/Inter-italic.var-latin.woff2") format("woff2")',
          },
        },
      ])
    },
  ],
}
