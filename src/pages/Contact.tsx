import React from 'react';

export default function Contact() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold text-gray-900 mb-6">Contact</h1>
      <div className="prose prose-lg">
        <p className="text-lg text-gray-600 mb-6">
          Get in touch with us for questions, feedback, or collaboration
          opportunities.
        </p>
        
        <div className="bg-gray-50 p-6 rounded-lg">
          <h2 className="text-2xl font-semibold text-gray-900 mb-4">
            Project Information
          </h2>
          <div className="space-y-3">
            <div>
              <span className="font-medium text-gray-700">Repository:</span>
              <span className="ml-2 text-gray-600">Colombia-cyber/the-adriana-guide</span>
            </div>
            <div>
              <span className="font-medium text-gray-700">Technology Stack:</span>
              <span className="ml-2 text-gray-600">React + TypeScript + Vite + Tailwind</span>
            </div>
            <div>
              <span className="font-medium text-gray-700">License:</span>
              <span className="ml-2 text-gray-600">Open Source</span>
            </div>
          </div>
        </div>

        <p className="text-gray-600 mt-6">
          This is a sample contact page. In a real application, you would
          typically include a contact form, email addresses, or other ways
          for users to reach out.
        </p>
      </div>
    </div>
  );
}