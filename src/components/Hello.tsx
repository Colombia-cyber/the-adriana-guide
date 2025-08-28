import React from 'react';

export function Hello({ name }: { name?: string }) {
  return <div>Hello {name ?? 'World'}</div>;
}

export default Hello;