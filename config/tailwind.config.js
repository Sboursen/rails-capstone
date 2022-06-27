const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          primary: '#3678c2',

          secondary: '#60b524',

          accent: '#878a8f',

          neutral: '#434c55',

          'base-100': '#FFFFFF',

          info: '#3678c2',

          success: '#60b524',

          warning: '#FBBD23',

          error: '#F87272',
        },
      },
    ],
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('daisyui'),
  ],
};
