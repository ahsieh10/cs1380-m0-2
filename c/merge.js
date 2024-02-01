#!/usr/bin/env node

// merge two files---the incoming 1-page index and the global index (on disk)
// the details of the global index can be seen in the test cases.

const fs = require('fs');
// const {exit} = require('process');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
});

var parsedGrams = [];
const gramMap = new Map();

function compare(a, b) {
  if (a[1] == b[1]) {
    return 0;
  } else {
    return (a[1] < b[1]) ? 1 : -1;
  }
}

// TODO some code here
rl.on('line', (line) => {
  // TODO some code here
  var splitted = line.split(' | ');
  parsedGrams.push([splitted[0], parseInt(splitted[1]), splitted[2]]);
});

rl.on('close', () => {
  mergeIndices();
});

const mergeIndices = () => {
  // TODO some code here
  const data = fs.readFileSync(process.argv[2], 'utf-8');
  lines = data.split('\n');
  for (i = 0; i < lines.length; i++) {
    currentLine = lines[i];
    parts = currentLine.split(' | ');
    if (typeof parts[1] == 'string') {
      urls = parts[1].split(' ');
      subList = [];
      for (j = 0; j < urls.length; j += 2) {
        subList.push([urls[j], parseInt(urls[j + 1])]);
      }
      gramMap.set(parts[0], subList);
    }
  }
  for (i = 0; i < parsedGrams.length; i++) {
    currentData = parsedGrams[i];
    if (gramMap.has(currentData[0])) {
      currentList = gramMap.get(currentData[0]);
      content = [currentData[2], currentData[1]];
      currentList.push(content);
      currentList.sort(compare);
      gramMap.set(currentData[0], currentList);
    } else {
      newList = [];
      let content = [currentData[2], currentData[1]];
      newList.push(content);
      gramMap.set(currentData[0], newList);
    }
  }
  for (let gram of gramMap.keys()) {
    value = gramMap.get(gram);
    finalStr = gram + ' | ';
    for (i = 0; i < value.length; i++) {
      finalStr += value[i][0] + ' ' + value[i][1] + ' ';
    }
    finalStr = finalStr.substring(0, finalStr.length - 1);
    console.log(finalStr);
  }
};
