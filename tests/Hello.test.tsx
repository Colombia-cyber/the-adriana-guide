import { render, screen } from '@testing-library/react';
import Hello from '../src/components/Hello';
import { it, expect } from 'vitest';

it('renders greeting', () => {
  render(<Hello name="Adriana" />);
  expect(screen.getByText('Hello Adriana')).toBeInTheDocument();
});