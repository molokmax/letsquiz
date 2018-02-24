const gulp = require('gulp');
const del = require('del');
const shell = require('gulp-shell');
const watch = require('gulp-watch');
var exec = require('child_process').exec;

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

gulp.task('default', ['build', 'deploy']);

gulp.task('deploy', function() {
  return exec('deploy.cmd');
});

gulp.task('clean', function () {
  return del.sync([paths.dist]);
});

gulp.task('build', ['clean', 'copy-all']);

gulp.task('watch', function() {
    gulp.watch(paths.src.root, ['copy-root', 'deploy']);
    gulp.watch(paths.src.app, ['copy-app', 'deploy']);
    gulp.watch(paths.src.fonts, ['copy-fonts', 'deploy']);
    gulp.watch(paths.src.image, ['copy-image', 'deploy']);
    gulp.watch(paths.src.photo, ['copy-photo', 'deploy']);
    gulp.watch(paths.src.templates, ['copy-templates', 'deploy']);
});



// copy block

gulp.task('copy-all', ['copy-root', 'copy-app', 'copy-fonts', 'copy-image', 'copy-photo', 'copy-templates']);

gulp.task('copy-root', [], function() {
  return gulp.src(paths.src.root)
    .pipe(gulp.dest(paths.dist + '/'));
});

gulp.task('copy-app', [], function() {
  return gulp.src(paths.src.app)
    .pipe(gulp.dest(paths.dist + '/app/'));
});

gulp.task('copy-fonts', [], function() {
  gulp.src(paths.src.fonts)
    .pipe(gulp.dest(paths.dist + '/fonts/'));
});

gulp.task('copy-image', [], function() {
  return gulp.src(paths.src.image)
    .pipe(gulp.dest(paths.dist + '/image/'));
});

gulp.task('copy-photo', [], function() {
  return gulp.src(paths.src.photo)
    .pipe(gulp.dest(paths.dist + '/photo/'));
});

gulp.task('copy-templates', [], function() {
  return gulp.src(paths.src.templates)
    .pipe(gulp.dest(paths.dist + '/templates/'));
});

// end copy block
