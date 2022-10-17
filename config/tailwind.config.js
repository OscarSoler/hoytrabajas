const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
	content: [
		'./public/*.html',
		'./app/helpers/**/*.rb',
		'./app/javascript/**/*.js',
		'./app/views/**/*.{erb,haml,html,slim}'
	],
	theme: {
		extend: {
			fontFamily: {
				sans: ['Poppins', ...defaultTheme.fontFamily.sans],
			},
			colors: {
				primary: {
					500: "#FFE554",
					600: "#f8da2c"
				},
				secondary: {
					500: "#00365F"
				}
			}
		},
	},
	plugins: [
		require('@tailwindcss/forms'),
		require('@tailwindcss/aspect-ratio'),
		require('@tailwindcss/typography'),
	]
}
