import React from 'react';

export default function Home() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold text-gray-900 mb-6">
        Welcome to The Adriana Guide
      </h1>
      <div className="prose prose-lg">
        <p className="text-lg text-gray-600 mb-4">
          This is the home page of The Adriana Guide - a comprehensive resource
          built with modern web technologies.
        </p>
        <p className="text-gray-600">
          This site is built with:
        </p>
        <ul className="list-disc list-inside text-gray-600 mt-2 space-y-1">
          <li>React 18 with TypeScript</li>
          <li>Vite for fast development and building</li>
          <li>Tailwind CSS for styling</li>
          <li>React Router for navigation</li>
          <li>Vitest for testing</li>
          <li>ESLint for code quality</li>
        </ul>
      </div>
    </div>
  );
}