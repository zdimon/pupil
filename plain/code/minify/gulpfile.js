console.log('Start');

var concat = require('gulp-concat');
var gulp = require('gulp');
var uglify = require('gulp-uglify');


gulp.task('default', function() {
  gulp.src(['./app.js', './ctrl.js'])
    .pipe(concat('all.js'))
    .pipe(uglify())
    .pipe(gulp.dest('./dist/'))
});

/*



*/