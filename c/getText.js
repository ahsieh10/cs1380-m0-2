#!/usr/bin/env node

// Extract text from a web page

const {convert} = require('html-to-text');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
});

// TODO Add some code
allDocument = '';

rl.on('line', (line) => {
  // TODO Add some code
  allDocument += line;
  allDocument += '\n';
});

rl.on('close', () => {
  // TODO Add some code
  const text = convert(allDocument);
  console.log(text);
});
