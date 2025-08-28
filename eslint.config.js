import js from '@eslint/js';
import react from 'eslint-plugin-react';

export default [
  {
    ignores: ['dist/**', 'node_modules/**', '*.config.js']
  },
  js.configs.recommended,
  {
    files: ['src/**/*.{js,jsx,ts,tsx}'],
    plugins: {
      react
    },
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      parserOptions: {
        ecmaFeatures: {
          jsx: true
        }
      },
      globals: {
        window: 'readonly',
        document: 'readonly',
        console: 'readonly',
        process: 'readonly'
      }
    },
    settings: {
      react: {
        version: 'detect'
      }
    },
    rules: {
      'no-unused-vars': 'warn',
      'no-console': 'off',
      'react/jsx-uses-react': 'error',
      'react/jsx-uses-vars': 'error'
    }
  }
];