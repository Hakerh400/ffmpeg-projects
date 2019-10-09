'use strict';

var fs = require('fs');
var path = require('path');
var cp = require('child_process');
const O = require('../../JavaScript/framework');

const TRIM = 5;

const inputFile = 'C:/Users/Thomas/Downloads/1.mp4';
const outputFile = 'C:/wamp/www/projects/video/1.mp4';

setTimeout(main);

function main(){
  var dur = getDur(inputFile);
  
  spawn('ffmpeg', [
    '-i', inputFile,
    '-c', 'copy',
    '-ss', TRIM,
    '-to', dur - TRIM,
    '-y', outputFile,
  ]);
}

function getDur(file){
  return spawn('ffprobe', [
    '-v', '0',
    '-show_entries', 'format=duration',
    '-of', 'compact=p=0:nk=1',
    '-i', file,
  ]).match(/\d+(?:\.\d*)/)[0] | 0;
}

function spawn(proc, args){
  args = [
    '/k', 'cls', '&&',
    proc, ...args,
  ];

  return cp.spawnSync('cmd', args).stdout.toString();
}