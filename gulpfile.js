"use strict";

const gulp = require('gulp');
const del = require('del');
const autoprefixer = require('gulp-autoprefixer');
const imagemin = require('gulp-imagemin');
var exec = require('child_process').exec;
//var runSequence = require('run-sequence').use(gulp);

const paths = {
    dist: 'D:/develop/denwer/home/test1.ru/www',
    src: {
        root: ['*.{js,php}', '!gulpfile.js'],
        libs: {
          smarty: './libs/smarty/**/*', 
          slick: './slick/**/*', 
          pnotify: './pnotify/**/*'
        },
        css: ['./*.css'],
        app: './app/*',
        fonts: './fonts/*',
        image: './image/*',
        photo: './photo/*',
        templates: './templates/*',
    }
};

gulp.task('default', ['build', 'watch'], function() {
  //gulp.run('deploy');
});
//gulp.task('default', ['build', 'watch', 'deploy']);

// gulp.task('deploy', function() {
//   setTimeout(function() {
//     exec('deploy.cmd');
//   }, 5000);
// });

gulp.task('clean', function () {
  del.sync([paths.dist], { force: true });
});

gulp.task('build', ['clean', 'copy-all']);

gulp.task('watch', function() {
  gulp.watch(paths.src.root, ['copy-root']);
  gulp.watch(paths.src.css, ['copy-css']);
  gulp.watch(paths.src.app, ['copy-app']);
  gulp.watch(paths.src.fonts, ['copy-fonts']);
  gulp.watch(paths.src.image, ['copy-image']);
  gulp.watch(paths.src.photo, ['copy-photo']);
  gulp.watch(paths.src.templates, ['copy-templates']);
});



// copy block

gulp.task('copy-all', ['copy-libs', 'copy-root', 'copy-app', 'copy-css', 'copy-fonts', 'copy-image', 'copy-photo', 'copy-templates']);

gulp.task('copy-libs', function() {
  gulp.src(paths.src.libs.smarty)
    .pipe(gulp.dest(paths.dist + '/libs/smarty/'));
  gulp.src(paths.src.libs.slick)
    .pipe(gulp.dest(paths.dist + '/slick/'));
  gulp.src(paths.src.libs.pnotify)
    .pipe(gulp.dest(paths.dist + '/pnotify/'));
});

gulp.task('copy-root', function() {
  gulp.src(paths.src.root)
    .pipe(gulp.dest(paths.dist + '/'));
});

gulp.task('copy-css', function() {
  gulp.src(paths.src.css)
    .pipe(autoprefixer())
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
    .pipe(imagemin([
      imagemin.jpegtran({progressive: true}),
      imagemin.optipng({optimizationLevel: 5})
    ], {
      verbose: false
    }))
    .pipe(gulp.dest(paths.dist + '/image/'));
});

gulp.task('copy-photo', function() {
  gulp.src(paths.src.photo)
    .pipe(imagemin([
      imagemin.jpegtran({progressive: true}),
      imagemin.optipng({optimizationLevel: 5})
    ], {
      verbose: false
    }))
    .pipe(gulp.dest(paths.dist + '/photo/'));
});

gulp.task('copy-templates', function() {
  gulp.src(paths.src.templates)
    .pipe(gulp.dest(paths.dist + '/templates/'));
});

// end copy block
