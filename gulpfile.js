"use strict";

const gulp = require('gulp');
const del = require('del');
//const shell = require('gulp-shell');
//const watch = require('gulp-watch');
var exec = require('child_process').exec;
//var runSequence = require('run-sequence').use(gulp);

const paths = {
    dist: 'dist',
    src: {
        root: ['*.{js,php,css}', '!gulpfile.js'],
        app: './app/*',
        fonts: './fonts/*',
        image: './image/*',
        photo: './photo/*',
        templates: './templates/*',
    }
};

gulp.task('default', ['build', 'watch', 'deploy']);

gulp.task('deploy', function() {
  setTimeout(function() {
    exec('deploy.cmd');
  }, 500);
});

gulp.task('clean', function () {
  del.sync([paths.dist]);
});

gulp.task('build', ['clean', 'copy-all']);

gulp.task('watch', function() {
  setTimeout(function() {
    gulp.watch(paths.src.root, ['copy-root', 'deploy']);
    gulp.watch(paths.src.app, ['copy-app', 'deploy']);
    gulp.watch(paths.src.fonts, ['copy-fonts', 'deploy']);
    gulp.watch(paths.src.image, ['copy-image', 'deploy']);
    gulp.watch(paths.src.photo, ['copy-photo', 'deploy']);
    gulp.watch(paths.src.templates, ['copy-templates', 'deploy']);
  }, 500);
});



// copy block

gulp.task('copy-all', ['copy-root', 'copy-app', 'copy-fonts', 'copy-image', 'copy-photo', 'copy-templates']);

gulp.task('copy-root', function() {
  gulp.src(paths.src.root)
    .pipe(gulp.dest(paths.dist + '/'));
});

gulp.task('copy-app', function() {
  gulp.src(paths.src.app)
    .pipe(gulp.dest(paths.dist + '/app/'));
});

gulp.task('copy-fonts', function() {
  gulp.src(paths.src.fonts)
    .pipe(gulp.dest(paths.dist + '/fonts/'));
});

gulp.task('copy-image', function() {
  gulp.src(paths.src.image)
    .pipe(gulp.dest(paths.dist + '/image/'));
});

gulp.task('copy-photo', function() {
  gulp.src(paths.src.photo)
    .pipe(gulp.dest(paths.dist + '/photo/'));
});

gulp.task('copy-templates', function() {
  gulp.src(paths.src.templates)
    .pipe(gulp.dest(paths.dist + '/templates/'));
});

// end copy block
