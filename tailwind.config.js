module.exports = {
  darkMode: 'class', // to activate class toggle
  content: [
    "./app/views/**/*.{html,html.erb,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,jsx,ts,tsx}",
    "./app/assets/stylesheets/**/*.css",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", "ui-sans-serif", "system-ui", "sans-serif"],
        serif: ['"Noto Serif"', "ui-serif", "Georgia", "serif"],
        mono: ['"Fira Code"', "ui-monospace", "monospace"],
      },
    },
  },
  plugins: [],
};
