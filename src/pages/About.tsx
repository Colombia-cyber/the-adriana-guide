import React from 'react';

export default function About() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold text-gray-900 mb-6">About</h1>
      <div className="prose prose-lg">
        <p className="text-lg text-gray-600 mb-4">
          The Adriana Guide is designed to be a comprehensive and accessible
          resource for the community.
        </p>
        <p className="text-gray-600 mb-4">
          This project demonstrates modern web development practices using
          React, TypeScript, and Tailwind CSS. It's built with accessibility,
          performance, and maintainability in mind.
        </p>
        <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">
          Key Features
        </h2>
        <ul className="list-disc list-inside text-gray-600 space-y-2">
          <li>Responsive design that works on all devices</li>
          <li>Fast loading with Vite's optimized build process</li>
          <li>Type-safe development with TypeScript</li>
          <li>Modern styling with Tailwind CSS utilities</li>
          <li>Comprehensive testing setup with Vitest</li>
          <li>Code quality assurance with ESLint</li>
        </ul>
      </div>
    </div>
  );
}