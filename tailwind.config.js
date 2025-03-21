/** @type {import('tailwindcss').Config} */
module.exports = {
    darkMode: ["class"],
    content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
  	extend: {
  		colors: {
  			background: 'hsl(var(--background))',
  			foreground: 'hsl(var(--foreground))',
  			btn: {
  				background: 'hsl(var(--btn-background))',
  				'background-hover': 'hsl(var(--btn-background-hover))'
  			},
  			melon: {
  				'100': '#401a0f',
  				'200': '#81341e',
  				'300': '#c14d2d',
  				'400': '#db7d64',
  				'500': '#eab3a4',
  				'600': '#eec2b6',
  				'700': '#f2d2c8',
  				'800': '#f6e1db',
  				'900': '#fbf0ed',
  				DEFAULT: '#EAB3A4'
  			},
  			ebony: {
  				'100': '#151613',
  				'200': '#2a2b26',
  				'300': '#3f413a',
  				'400': '#54564d',
  				'500': '#696c5f',
  				'600': '#898c7d',
  				'700': '#a6a99e',
  				'800': '#c4c5be',
  				'900': '#e1e2df',
  				DEFAULT: '#696C5F'
  			},
  			bittersweet: {
  				'100': '#370e08',
  				'200': '#6e1d10',
  				'300': '#a52b19',
  				'400': '#dc3a21',
  				'500': '#e66854',
  				'600': '#eb8778',
  				'700': '#f0a59a',
  				'800': '#f5c3bc',
  				'900': '#fae1dd',
  				DEFAULT: '#E66854'
  			},
  			chili_red: {
  				'100': '#2d0a02',
  				'200': '#591405',
  				'300': '#861e07',
  				'400': '#b22809',
  				'500': '#de320c',
  				'600': '#f4522e',
  				'700': '#f77d62',
  				'800': '#f9a996',
  				'900': '#fcd4cb',
  				DEFAULT: '#DE320C'
  			},
  			office_green: {
  				'100': '#0a1601',
  				'200': '#142c03',
  				'300': '#1e4204',
  				'400': '#285806',
  				'500': '#326f07',
  				'600': '#54b80c',
  				'700': '#78f122',
  				'800': '#a5f66b',
  				'900': '#d2fab5',
  				DEFAULT: '#326F07'
  			},
  			bone: {
  				'100': '#2c2a20',
  				'200': '#58543f',
  				'300': '#837e5f',
  				'400': '#a8a386',
  				'500': '#c8c5b3',
  				'600': '#d2d0c1',
  				'700': '#dedcd1',
  				'800': '#e9e7e0',
  				'900': '#f4f3f0',
  				DEFAULT: '#C8C5B3'
  			},
  			black: {
  				'100': '#000000',
  				'200': '#000000',
  				'300': '#000000',
  				'400': '#000000',
  				'500': '#000000',
  				'600': '#333333',
  				'700': '#666666',
  				'800': '#999999',
  				'900': '#cccccc',
  				DEFAULT: '#000000'
  			},
  			platinum: {
  				'100': '#302c2c',
  				'200': '#5f5858',
  				'300': '#8e8585',
  				'400': '#bab5b5',
  				'500': '#e7e5e5',
  				'600': '#ebeaea',
  				'700': '#f0efef',
  				'800': '#f5f4f4',
  				'900': '#fafafa',
  				DEFAULT: '#E7E5E5'
  			},
  			pistachio: {
  				'100': '#1b2a11',
  				'200': '#355321',
  				'300': '#507d32',
  				'400': '#6aa642',
  				'500': '#88c162',
  				'600': '#a0cd82',
  				'700': '#b8d9a1',
  				'800': '#cfe6c0',
  				'900': '#e7f2e0',
  				DEFAULT: '#88C162'
  			},
  			india_green: {
  				'100': '#0c1b01',
  				'200': '#173502',
  				'300': '#235003',
  				'400': '#2f6a04',
  				'500': '#3b8705',
  				'600': '#5acd07',
  				'700': '#7ef727',
  				'800': '#a9fa6f',
  				'900': '#d4fcb7',
  				DEFAULT: '#3B8705'
  			},
  			'anti-flash_white': {
  				'100': '#24293e',
  				'200': '#48537b',
  				'300': '#7782af',
  				'400': '#b4bbd3',
  				'500': '#f3f4f8',
  				'600': '#f5f6f9',
  				'700': '#f7f8fa',
  				'800': '#fafafc',
  				'900': '#fcfdfd',
  				DEFAULT: '#F3F4F8'
  			},
  			black_bean: {
  				'100': '#0b0101',
  				'200': '#150102',
  				'300': '#200202',
  				'400': '#2a0203',
  				'500': '#330304',
  				'600': '#8b080a',
  				'700': '#e10d11',
  				'800': '#f55356',
  				'900': '#faa9ab',
  				DEFAULT: '#330304'
  			},
  			oxford_blue: {
  				'100': '#000006',
  				'200': '#00000c',
  				'300': '#000012',
  				'400': '#000018',
  				'500': '#000021',
  				'600': '#00007e',
  				'700': '#0000de',
  				'800': '#3f3fff',
  				'900': '#9f9fff',
  				DEFAULT: '#000021'
  			},
  			card: {
  				DEFAULT: 'hsl(var(--card))',
  				foreground: 'hsl(var(--card-foreground))'
  			},
  			popover: {
  				DEFAULT: 'hsl(var(--popover))',
  				foreground: 'hsl(var(--popover-foreground))'
  			},
  			primary: {
  				DEFAULT: 'hsl(var(--primary))',
  				foreground: 'hsl(var(--primary-foreground))'
  			},
  			secondary: {
  				DEFAULT: 'hsl(var(--secondary))',
  				foreground: 'hsl(var(--secondary-foreground))'
  			},
  			muted: {
  				DEFAULT: 'hsl(var(--muted))',
  				foreground: 'hsl(var(--muted-foreground))'
  			},
  			accent: {
  				DEFAULT: 'hsl(var(--accent))',
  				foreground: 'hsl(var(--accent-foreground))'
  			},
  			destructive: {
  				DEFAULT: 'hsl(var(--destructive))',
  				foreground: 'hsl(var(--destructive-foreground))'
  			},
  			border: 'hsl(var(--border))',
  			input: 'hsl(var(--input))',
  			ring: 'hsl(var(--ring))',
  			chart: {
  				'1': 'hsl(var(--chart-1))',
  				'2': 'hsl(var(--chart-2))',
  				'3': 'hsl(var(--chart-3))',
  				'4': 'hsl(var(--chart-4))',
  				'5': 'hsl(var(--chart-5))'
  			}
  		},
  		borderRadius: {
  			lg: 'var(--radius)',
  			md: 'calc(var(--radius) - 2px)',
  			sm: 'calc(var(--radius) - 4px)'
  		}
  	}
  },
  plugins: [require("tailwindcss-animate")],
};
