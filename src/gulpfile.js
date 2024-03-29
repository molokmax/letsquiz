"use strict";

/* config example

module.exports = {
    ftp_url: 'ftp.quiz.ru',
    ftp_port: 21,
    ftp_user: 'username',
    ftp_pass: 'password',
    ftp_path: '/domains/quiz.ru/public_html/',
 }

*/
const config = require('./secret.config');
const gulp = require('gulp');
const del = require('del');
const autoprefixer = require('gulp-autoprefixer');
const imagemin = require('gulp-imagemin');
const ftp = require('vinyl-ftp');
const exec = require('child_process').exec;

const paths = {
    dist: '../build',
    // dist: '../docker/app/build',
    // dist: 'D:/develop/denwer/home/test1.ru/www',
    // build_dir: './build',
    src: {
        root: ['*.{js,php,pdf}', '.htaccess', '!gulpfile.js', '!secret.config.js'],
        libs: {
          smarty: './libs/smarty/**/*', 
          mailer: './libs/PHPMailer/**/*', 
          //slick: './slick/**/*', 
          vendor: './vendor/**/*'
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

function prodDeploy(libs, vendor, photo) {
  var src = [paths.dist + '/**/*', '!'+paths.dist+'/config.php', '!'+paths.dist+'/.htaccess'];
  if (!libs) {
    src.push('!'+paths.dist+'/libs/**/*');
  }
  if (!vendor) {
    src.push('!'+paths.dist+'/vendor/**/*');
  }
  if (!photo) {
    src.push('!'+paths.dist+'/photo/**/*');
  }
  var conn = ftp.create( {
    host: config.ftp_url,
    port: config.ftp_port,
    user: config.ftp_user,
    password: config.ftp_pass,
    parallel: 10
  });
  return gulp.src(src, { buffer: false })
    .pipe(conn.newer(config.ftp_path)) // only upload newer files
    .pipe(conn.dest(config.ftp_path));
}

gulp.task('prod-deploy-full-libs', function() {
  return prodDeploy(true, true, true);
});

gulp.task('prod-deploy-full', function() {
  //del.sync([paths.build_dir], { force: true });
  return prodDeploy(false, true, true);
});

gulp.task('prod-deploy', function() {
  return prodDeploy(false, false, false);
});

gulp.task('dev-deploy', function() {
  var htmlDir = '/var/www/html/';
  var cmd = `docker cp ${paths.dist}/. letsquiz-app:${htmlDir} && docker exec letsquiz-app chmod -R 777 ${htmlDir}`;
  exec(cmd, function(err) {
    if (err) {
      console.error(err)
    }
  })
});

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

// gulp.task('dev-watch', function() {
//   gulp.watch('./**/*', ['build', 'dev-deploy']);
// });

// copy block

gulp.task('copy-all', ['copy-libs', 'copy-root', 'copy-app', 'copy-css', 'copy-fonts', 'copy-image', 'copy-photo', 'copy-templates']);

gulp.task('copy-libs', function() {
  gulp.src(paths.src.libs.smarty)
    .pipe(gulp.dest(paths.dist + '/libs/smarty/'));
    gulp.src(paths.src.libs.mailer)
      .pipe(gulp.dest(paths.dist + '/libs/PHPMailer/'));
  //gulp.src(paths.src.libs.slick)
  //  .pipe(gulp.dest(paths.dist + '/slick/'));
  gulp.src(paths.src.libs.vendor)
    .pipe(gulp.dest(paths.dist + '/vendor/'));
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
